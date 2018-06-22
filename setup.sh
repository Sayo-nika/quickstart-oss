#!/bin/bash

cwd = "$HOME/build/"
date= `date '+%Y%m%d'Z`
auth = "AWS4-HMAC-SHA256 Credential=29fc312082d26720ceeec6e89630f6d2fc382a96c7a72b1c/$date/us-standard/s3/aws4_request,SignedHeaders=host;x-amz-date; Signature=d23d3c27273e2fbac6caf3da2068d5118caa930e85ebe33ac44c06d1529bcb1d"
# This is intended for automating unzipping and putting the RPAs into the respect folder

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Checking for dir if it exists"
if [ -d "$cwd/mod" ]; then
  # dir exists, just unzip, and make new dir to add files
  echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Directory exists. Creating game/ subdir and copying files over."
  wget -d --header="Authorization: $auth" https://s3-api.us-geo.objectstorage.softlayer.net/filepub/ddlc_pkg.zip 
  mkdir -p "$cwd/mod/game"
  unzip ddlc_pkg.zip -d  mod/game 
   exit 0
  else 
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Directory  does not exist. Creating dir and copying files over" 
    mkdir -p mod
    wget -d --header="Authorization: $auth" https://s3-api.us-geo.objectstorage.softlayer.net/filepub/ddlc_pkg.zip 
    mkdir -p "mod/game"
    unzip ddlc_pkg.zip -d  mod/game    
    exit 0 
fi


createHMACSig() {

}