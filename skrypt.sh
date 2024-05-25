#!/bin/bash

logs()
{
  num_files=$1
  for ((i=1; i<=num_files; i++)); do
    filename="log$i.txt"
    echo "File name: $filename" >> $filename
    echo "Created by script: $0" >> $filename
    echo "Date: $(date)" >> $filename
  done
}

error()
{
  num_files=$1
  for ((i=1; i<=num_files; i++)); do
    dirname="error$i"
    mkdir $dirname
    filename="$dirname.txt"
    echo "File name: $filename" >> $dirname/$filename
    echo "Created by script: $0" >> $dirname/$filename
    echo "Date: $(date)" >> $dirname/$filename
  done
}

help()
{
  echo "Available options:"
  echo "--date | -d"
  echo "--logs | -l"
  echo "--help | -h"
}

init()
{
  repo="https://github.com/kapsiu/Lab-4"
  git clone $repo
  export PATH=$PATH:$(pwd)
}

case "$1" in
  --date | -d)
      date ;;
  --logs | -l)
      if [ -n "$2" ]
      then
        logs $2
      else
        logs 100
      fi ;;
  --help | -h)
      help ;;
  --init)
      init ;;
  --error | -e)
    if [ -n "$2" ]
    then
      error $2
    else
      error 100
    fi ;;
esac