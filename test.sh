#!/bin/bash

D1=`date -d '1 days ago' +%Y-%m-%d`
D1S=`date -d '1 days ago' +%m%d`
D2=`date +%Y%m%d`
mysqldump -utony -ptony tony seed --where="created_at between '${D1}' and '${D2}'" > ${D1S}.sql
zip ${D1S}.zip ${D1S}.sql
