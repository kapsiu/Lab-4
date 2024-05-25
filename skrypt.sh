#!/bin/bash

logs()
{
  for ((i=1; i<=100; i++)); do
    filename="log$i.txt"
    echo "File name: $filename" >> $filename
    echo "Created by script: $0" >> $filename
    echo "Date: $(date)" >> $filename
  done
}

case "$1" in
  --date)
      date ;;
  --logs)
      logs ;;
esac