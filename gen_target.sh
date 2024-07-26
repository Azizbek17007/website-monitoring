#!/bin/bash

config_file="config/prometheus/targets.yml"

echo "Script started."

if [ $# -lt 1 ] ; then
  echo "Usage: $0 mudofaa.uz mail.mil.uz"
  exit 1
fi

if [ -f ${config_file} ] ; then
  echo "Backing up existing config file."
  mv -v ${config_file} ${config_file}-$(date '+%s')
fi

echo "Creating new config file."
echo "- targets:" > ${config_file}

for x in $@ ; do
  echo "Adding target: ${x}"
  echo "  - ${x}" >> ${config_file}
done

echo "Script finished."
