#!/bin/bash

apikey = "6djJX9_ubYUj9aBpLggykL8kdnqmaiwdY8efJZuzqFGN"

# This is intended for automating unzipping and putting the RPAs into the respect folder

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Checking for dir if it exists"
if [ -d "$cwd/mod" ]; then
  # dir exists, just unzip, and make new dir to add files
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Directory exists. Creating game/ subdir and copying files over."
  wget -d --header="Authorization: Bearer $apiKey" https://s3-api.us-geo.objectstorage.softlayer.net/filepub/ddlc_pkg.zip 
  mkdir -p "$cwd/mod/game"
  unzip ddlc_pkg.zip -d  mod/game 
   exit 0
  else 
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Directory  does not exist. Creating dir and copying files over" 
    mkdir -p mod
    wget -d --header="Authorization: Bearer $apiKey" https://s3-api.us-geo.objectstorage.softlayer.net/filepub/ddlc_pkg.zip 
    mkdir -p "mod/game"
    unzip ddlc_pkg.zip -d  mod/game    
    exit 0 
fi