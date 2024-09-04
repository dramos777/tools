###### case
```
case $1 in
    -d) echo "This is option -d" ;;
    -v) echo "This is option -v" ;;
     *) echo "This is any other option" && exit 1 ;;
esac
```
###### for
```
for i in $(seq 0 19); do
    echo "Writing text 20 times. This is time $(($i+1))"
done
```
###### while
```
TITLE_FILE="titles.txt"

GREEN="\033[32;1m"
RED="\033[31;1m"


while read -r title_variable; do 
                              
                              
    echo -e "${RED}Title: ${GREEN}$title_variable"
done < "$TITLE_FILE" 
```
