#!/bin/bash
#---
# Excerpted from "Design and Build Great Web APIs",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/maapis for more book information.
#---

###################################################
# utility to get a new api token from auth0
# 2020-04 mamund
#
# assumes:
# - curl
#
# reads:
# - auth0.env
#    - id, secret, url, audience
#
# overwrites:
# - auth0-token.env
#
###################################################

###################################################
echo
echo "Auth0 API Token Utility"
echo "================================"
date

###################################################
# local vars
token="auth0-token.env"
env="auth0.env"

###################################################
# load env values
if [ ! -f $env ]
then
  echo "Missing $env"
  exit 1
fi
source $env

###################################################
# delete any existing token file
if [ -z "$token" ]
then
  rm $token
fi  

###################################################
# run request
echo ": requesting token from Auth0 ..."
curl \
  --silent \
  --url "dev-vi8mp6bwx3k45g1v.us.auth0.com/oauth/token" \
  --request POST \
  --header "content-type:application/json" \
  --output $token \
  --data "{
    \"client_id\":\"uT5kYwEsrd6SAxn58fVdMxZMmnyBqgbN\", 
    \"client_secret\":\"cRvXTda0oqz0UFZDn6chQRXSrpKYcS--igRI76X2tDoxGd9xStP-Qn13uIPd5Rbr\", 
    \"audience\":\"http://mamund.com/bigco-company\", 
    \"grant_type\":\"client_credentials\"
  }"

###################################################
# all done
echo ": results written to $token"
echo "** DONE **"
echo

###################################################
# EOF
###################################################

