#!/bin/sh

Zahir=Away
Farhanah=Away

macaddress="`wl -i eth1 assoclist` `wl -i eth2 assoclist` `wl -i eth3 assoclist`"

case "$macaddress" in
	*CC:C0:79:FE:2F:96*)
	Zahir=Home
	;;
esac

case "$macaddress" in
	*A0:CC:2B:14:0E:57*)
	Farhanah=Home
	;;
esac

if [ "$Zahir" = Home ]
then
	if [ ! -f /jffs/scripts/users/zahir ]
	then
		touch /jffs/scripts/users/zahir
		curl -H "Authorization: Bearer <ACCESS_TOKEN>" -X POST "https://<BASE_URL>/api/smartapps/installations/<APP_ID>/home"
	fi
else
	if [ -f /jffs/scripts/users/chad ]
	then
		rm -f /jffs/scripts/users/Zahir
		curl -H "Authorization: Bearer <ACCESS_TOKEN>" -X POST "https://<BASE_URL>/api/smartapps/installations/<APP_ID>/away"
	fi
fi

if [ "$farhanah" = Home ]
then
	if [ ! -f /jffs/scripts/users/farhanah ]
	then
		touch /jffs/scripts/users/farhanah
		curl -H "Authorization: Bearer <ACCESS_TOKEN>" -X POST "https://<BASE_URL>/api/smartapps/installations/<APP_ID>/home"
	fi
else
	if [ -f /jffs/scripts/users/farhanah ]
	then
		rm -f /jffs/scripts/users/farhanah
		curl -H "Authorization: Bearer <ACCESS_TOKEN>" -X POST "https://<BASE_URL>/api/smartapps/installations/<APP_ID>/away"
	fi
fi
