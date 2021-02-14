#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=asia.sparkpool.com:3333
WALLET=0x2dd9a734ffe4c75bbae173a13a5019b962eb1b76.lol123

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./lolMiner && ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
