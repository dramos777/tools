FROM_FILE="./config_file.txt"

while read -r line
do
  [ "$(echo $line | cut -c1)" = "#" ] && continue
  [ ! "$line" ] && continue

  key="$(echo $line | cut -d = -f 1)"
  value="$(echo $line | cut -d = -f 2)"
  
  echo "CONF_$key=$value"
 
done < "$FROM_FILE"
