#!/bin/bash
DIR=$(pwd -P)                   #get the DIR of script
chatID=XXXXXXXXX
source $HOME/.profile           #ENABLE CLI COMMANDS
export LC_NUMERIC="en_US.UTF-8"

SOLANA_PATH="$HOME/.local/share/solana/install/active_release/bin/solana"
DELINQUEENT=$($SOLANA_PATH validators --output json-compact | jq '.validators[] | select(.identityPubkey == "'"$(solana address)"'" ) | .delinquent ')
if [[ $DELINQUEENT == true ]] 
 then
   echo DELINQUEENT $(solana address)
   echo "`date +"%Y-%m-%d--%H:%M"` DELINQUEENT $(solana address) " >> $DIR/delinq.log
   "${DIR}/sendmess_delinq.sh" "$chatID" "DELINQUEENT $(solana address)" 2>&1 > /dev/null
 else
   echo OK $(solana address)
fi