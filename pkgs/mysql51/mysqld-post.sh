#!/bin/sh

while true; do
    response=`/usr/bin/mysqladmin -uUNKNOWN_USER ping 2>&1` && break
    echo "$response" | grep -q "mysqld is alive" && break
    sleep 1
done
