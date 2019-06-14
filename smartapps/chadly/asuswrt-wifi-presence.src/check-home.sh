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

case "$macaddress2" in
	*CC:C0:79:FE:2F:96*)
	Zahir=Home
	;;
esac

case "$macaddress" in
	*CC:C0:79:42:27:C6*)
	Hadeyah=Home
	;;
esac

case "$macaddress2" in
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
	  curl "https://graph-na02-useast1.api.smartthings.com/api/smartapps/installations/bad6ab3d-3155-4337-b9a2-ab8e5310c775/Phone/home?access_token=c7143b04-6ff3-4a43-a271-38142c331369" -k
	fi
else
	if [ -f /jffs/scripts/users/hadeyah ]
	then
	  rm -f /jffs/scripts/users/hadeyah
	  curl "https://graph-na02-useast1.api.smartthings.com/api/smartapps/installations/bad6ab3d-3155-4337-b9a2-ab8e5310c775/Phone/away?access_token=c7143b04-6ff3-4a43-a271-38142c331369" -k
	fi
fi

if [ "$farhanah" = Home ]
then
	if [ ! -f /jffs/scripts/users/farhanah ]
	then
	  touch /jffs/scripts/users/farhanah
	  curl "https://graph-na02-useast1.api.smartthings.com/api/smartapps/installations/1b0fc7a9-26b0-4d25-910b-6d05cd80ce85/Phone/home?access_token=5659ac8b-726b-43c9-9d0e-9279082e901f" -k
	fi
else
	if [ -f /jffs/scripts/users/farhanah ]
	then
	  rm -f /jffs/scripts/users/farhanah
	  curl "https://graph-na02-useast1.api.smartthings.com/api/smartapps/installations/1b0fc7a9-26b0-4d25-910b-6d05cd80ce85/Phone/away?access_token=5659ac8b-726b-43c9-9d0e-9279082e901f" -k
	fi
fi
