### case
```
case $1 in
    -d) [ $2 ]  && NIVEL_DEBUG=2 ;; #Se $2 existe e NIVEL_DEBUG=2
     *) Soma ;;
esac
```
