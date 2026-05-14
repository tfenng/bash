#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Usage: $0 <db_name> <table_name> [created_col]"
  echo "  created_col: column name for time filter (default: created_at)"
  exit 1
fi

DB="$1"
TABLE="$2"
CREATED_COL="${3:-created_at}"

D1=$(date -v-1d +%Y-%m-%d 2>/dev/null || date -d '1 days ago' +%Y-%m-%d)
D1S=$(date -v-1d +%m%d 2>/dev/null || date -d '1 days ago' +%m%d)
D2=$(date +%Y%m%d)
mysqldump -utony -ptony "$DB" "$TABLE" --where="${CREATED_COL} between '${D1}' and '${D2}'" > "${D1S}.sql"
zip "${D1S}.zip" "${D1S}.sql"
