#!/bin/bash

function pricecheck() {
	if curl -s "$webserv" | grep "$keyword"
	then
	    # if the keyword is in the conent
	    echo " no price change"
	else
	    echo "price change! Sending email!"
			swaks --to myemail@gmail.com --header "Subject: Price change!" --body "There was probably a price change for $webserv from $keyword" --from "myemail@gmail.com" --server smtp.gmail.com:587 --auth LOGIN --auth-user "myemail@gmail.com" --auth-password "mypassword" -tls

	fi
}

webserv="https://www.digitalcombatsimulator.com/en/shop/terrains/nttr_terrain/"
keyword="49.99"
pricecheck

webserv="https://www.digitalcombatsimulator.com/en/shop/terrains/persiangulf_terrain/"
keyword="49.99"
pricecheck

# use [crontab -e] to run this every day. just add a line like this (replace to your path):
# 0 6 * * * /home/pi/1scripts/pricecheck.sh  >/dev/null 2>&1
# above line will run pricecheck every day at 6am
