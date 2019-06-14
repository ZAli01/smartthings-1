#!/bin/sh

Zahir=Away
Farhanah=Away
Hadeyah=Away

macaddress=`wl -i eth1 assoclist`
macaddress2=`wl -i eth2 assoclist`

case "$macaddress" in
	*CC:C0:79:FE:2F:96*)
	Zahir=Home
	;;
esac

case "$macaddress" in
	*CC:C0:79:42:27:C6*)
	Hadeyah=Home
	;;
esac

case "$macaddress" in
	*A0:CC:2B:14:0E:57*)
	Farhanah=Home
	;;
esac

case "$macaddress2" in
	*CC:C0:79:FE:2F:96*)
	Zahir=Home
	;;
esac

case "$macaddress2" in
	*CC:C0:79:42:27:C6*)
	Hadeyah=Home
	;;
esac

case "$macaddress2" in
	*A0:CC:2B:14:0E:57*)
	Farhanah=Home
	;;
esac

if [ "$Zahir" = Home ]
then
	if [ ! -f /jffs/scripts/users/zahir ]
	then
	  touch /jffs/scripts/users/zahir
  	  curl "https://graph-na02-useast1.api.smartthings.com/api/smartapps/installations/e9aeb481-42e1-4161-9ba7-5c976e3809fc/Phone/home?access_token=d6fa95f2-77ca-4f65-b972-3ca068d20a3a" -k
	fi
else
	if [ -f /jffs/scripts/users/zahir ]
	then
	  rm -f /jffs/scripts/users/Zahir
	  curl "https://graph-na02-useast1.api.smartthings.com/api/smartapps/installations/e9aeb481-42e1-4161-9ba7-5c976e3809fc/Phone/away?access_token=d6fa95f2-77ca-4f65-b972-3ca068d20a3a" -k
	fi
fi

if [ "$Hadeyah" = Home ]
then
	if [ ! -f /jffs/scripts/users/hadeyah ]
	then
		touch /jffs/scripts/users/hadeyah
	fi
else
	if [ -f /jffs/scripts/users/hadeyah ]
	then
		rm -f /jffs/scripts/users/hadeyah
	fi
fi

if [ "$farhanah" = Home ]
then
	if [ ! -f /jffs/scripts/users/farhanah ]
	then
		touch /jffs/scripts/users/farhanah
	fi
else
	if [ -f /jffs/scripts/users/farhanah ]
	then
		rm -f /jffs/scripts/users/farhanah
	fi
fi
