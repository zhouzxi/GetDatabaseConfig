#!/bin/ksh

CFG_FILE=$HOME/etc/Config.ini

IP=` awk '$1~/\[.*/{_cdr_par_=0}\
         $0 ~ /^ *\[ *network *\]/ {_cdr_par_=1}\
         $0~/^[\011 ]*ip *=.*/ { if(_cdr_par_==1) { sub("="," "); print $2; exit 0} }\
         ' ${CFG_FILE}`

PORT=` awk '$1~/\[.*/{_cdr_par_=0}\
          $0 ~ /^ *\[ *network *\]/ {_cdr_par_=1}\
         $0~/^[\011 ]*port *=.*/ { if(_cdr_par_==1) { sub("="," "); print $2; exit 0} }\
         ' ${CFG_FILE}`


main()
{
    echo "ip =" $IP
    echo "port =" $PORT
	
    echo "[network]" >> NetworkInfo.txt
    echo "ip=$IP" >> NetworkInfo.txt
    echo "port=$PORT" >> NetworkInfo.txt

    echo "finish !!!!!!!!!!!"
}

## Execute main function
main $*
