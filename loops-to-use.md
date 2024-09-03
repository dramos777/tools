### case
```
case $1 in
    -d) echo "This is option -d" ;;
    -v) echo "This is option -v" ;;
     *) echo "This is any other option" && exit 1 ;;
esac
```
### for
```
for i in $(seq 0 19); do
    echo "Writing text 20 times. This is time $(($i+1))"
done
```
