USER="email@here"
PASS="password@here"
  
COUNT=`curl -su $USER:$PASS https://mail.google.com/mail/feed/atom || echo "<fullcount>?</fullcount>"`
COUNT=`echo "$COUNT" | grep -oPm1 "(?<=<fullcount>)[^<]+" `

if [ "$COUNT" = "0" ]; then
    echo " "
else
    echo $COUNT
fi

if [ "$COUNT" != "0" ]; then
   if [ "$COUNT" = "1" ];then
      WORD="mail";
   else
      WORD="mails";
   fi
fi

