#!/bin/bash

bot_token="5324595629:AAGCJfVlOdT548b3RdYxlQSxbU3Nxu1T7Aw"       
chatID="$1"
msg="$2"
dat=`date +"%Y-%m-%d--%H:%M"`
 
curl -s -X POST  https://api.telegram.org/bot$bot_token/sendMessage -d chat_id=$chatID -d text="${dat}%0A${msg}"