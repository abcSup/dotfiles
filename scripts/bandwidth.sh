#!/bin/bash

FILE=/tmp/i3_blocks_bandwidth
touch $FILE

PREV_RX=$(cat $FILE | sed -n 1p)
PREV_TX=$(cat $FILE | sed -n 2p)
CUR_RX=0
CUR_TX=0

NETDIR=/sys/class/net
for IFACE in $(ls -1 $NETDIR); do
	if [ "$IFACE" == "lo" ]; then
		continue
	fi
	read N_RX < $NETDIR/$IFACE/statistics/rx_bytes
	read N_TX < $NETDIR/$IFACE/statistics/tx_bytes
    CUR_RX=$(( $CUR_RX + $N_RX))
    CUR_TX=$(( $CUR_TX + $N_TX))
done

DELTA_RX=$(($CUR_RX - $PREV_RX))
DELTA_TX=$(($CUR_TX - $PREV_TX))
printf "%-4i|%4i" $(($DELTA_RX / 1000)) $(($DELTA_TX / 1000))

echo $CUR_RX > $FILE
echo $CUR_TX >> $FILE

