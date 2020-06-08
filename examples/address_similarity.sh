#!/bin/bash -e

if [ $# -lt 1 ]; then
  echo "usage: $0 api_key [alternate_url]"
  exit 1
fi

address1='{ "houseNumber": "1600", "road": "Pennsylvania Ave N.W.", "city": "Washington", "state": "DC", "postcode": "20500" }'
address2='160 Pennsilvana Ave, Washington, D.C., 20500'

if [ -z "$2" ]; then
  url="https://api.rosette.com/rest/v1/address-similarity"
else
  url="$2/address-similarity"
fi

curl -s "$url" \
  -H "X-RosetteAPI-Key: $1" \
  -H 'Content-Type:application/json' \
  -H 'Accept:application/json' \
  -d "{\"address1\": $address1, \"address2\": $address2 }"
