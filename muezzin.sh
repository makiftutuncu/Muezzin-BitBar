#!/bin/bash

export PATH="/usr/local/bin:$PATH"

# Needs to be absolute path and make sure you have write permissions there.
DATA_FILE="/tmp/.muezzin.tsv"

function showHelp() {
    echo "You need to provide country id, city id and district id as arguments. Here are the options:"
    echo
    echo "-C | --country    Country id"
    echo "-c | --city       City id"
    echo "-d | --district   District id"
    echo "-h | --help       Show this help"
    echo
    echo "Example usage:"
    echo "./muezzin.sh --country 2 --city 539 --district 9541"
}

function run() {
    url="https://muezzin.herokuapp.com/prayerTimes/country/$COUNTRY_ID/city/$CITY_ID/district/$DISTRICT_ID"
    today=$(date +%Y-%m-%d)
    now=$(date +%H:%M)

    http --ignore-stdin $url | jq -r -c ".prayerTimes.\"$today\" | to_entries[] | [.key, .value] | @tsv" > $DATA_FILE

    nextPrayerTimeName=$(awk '$2>"'"$now"'" {print toupper(substr($1,1,1))tolower(substr($1,2))}' $DATA_FILE | head -n 1)
    nextPrayerTime=$(awk '$2>"'"$now"'" {print $2}' $DATA_FILE | head -n 1)

    echo "🕌 $nextPrayerTimeName ⏰ $nextPrayerTime"
    echo "---"
    awk '$1!="qibla"{print toupper(substr($1,1,1))tolower(substr($1,2))": "$2}' $DATA_FILE
}

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -C|--country)
    COUNTRY_ID="$2"
    shift # past argument
    shift # past value
    ;;
    -c|--city)
    CITY_ID="$2"
    shift # past argument
    shift # past value
    ;;
    -d|--district)
    DISTRICT_ID="$2"
    shift # past argument
    shift # past value
    ;;
    -h|--help)
    showHelp
    exit
    ;;
esac
done

if test -z "$COUNTRY_ID" -o -z "$CITY_ID" -o -z "$DISTRICT_ID"
then
    echo "Invalid or missing parameters!"
    showHelp
    exit 1
fi

run
