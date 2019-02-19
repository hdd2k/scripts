#!/bin/bash

url(){
  if [ ! -z "$1" ]; then
    wget "$1" >/dev/null 2>&1
    echo "$?"
    if [[ "$?" != 0 ]]; then
      echo "Url : $1 doesn't exists.. Exiting" && exit
    fi
  else
    echo "No URL Argument..exiting" & exit
  fi
}

folder(){
  if [ ! -z "$1" ]; then
    # Make directory if not exist
    if [ ! -d "$1" ]; then
      echo "Invalid Output Directory ... Creating dirs"
      mkdir -p "$1"
    fi
  else
    echo "No Output Directory Arguments..exiting" & exit
  fi
}

URL="$1"
OUTPUT_DIR="$2"

# check if valid url
url $URL
folder $OUTPUT_DIR


# https://inst.eecs.berkeley.edu/\~ee126/sp19/

# sync
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent -P $OUTPUT_DIR $URL
