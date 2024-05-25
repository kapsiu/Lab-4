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

help()
{
  echo "Available options:"
  echo "--date"
  echo "--logs"
  echo "--help"
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
esac