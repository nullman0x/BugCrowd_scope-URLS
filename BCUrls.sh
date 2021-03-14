#private
for ((i=0; i<=300; i+=25))
do
 curl 'https://bugcrowd.com/programs.json?points_only[]=false&sort[]=invited-desc&sort[]=promoted-desc&hidden[]=false&offset[]='$i'' -H 'cookie: _crowdcontrol_session='$1'' --compressed | jq -r '. | .programs[] | select (.invited_status=="accepted")  | select (.participation=="private") | .program_url ' >> Private.txt
 done
 

#plublic program
 for ((i=0; i<=300; i+=25)); 
 do 
 curl 'https://bugcrowd.com/programs.json?points_only[]=false&sort[]=invited-desc&sort[]=promoted-desc&hidden[]=false&offset[]='$i'' | jq -r '. | .programs[] | select (.participation=="public") | .program_url ' >> Public.txt

done

