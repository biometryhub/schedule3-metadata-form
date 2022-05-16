#!/bin/bash

# Quick script to scrape the generated XML from the Schedule 3
# project metadata and generate a list of outputs. Use with
#   ./list_outputs.sh XML/
#
# Code author: Russell A. Edson, Biometry Hub
# Date last modified: 16/05/2022
IFS=$'\n'

OUTPUTS=''
for FILE in $(find "$1" . -type f -name "*.xml")
do
  # Replace 'Variables: ' with 'Treatment factors: ' as appropriate
  VARIABLES=$(grep -oP '(?<=Variables: )[^\n]*(?=</p>)' "$FILE")
  OUTPUTS="$OUTPUTS,$VARIABLES"
done

echo "$OUTPUTS" | sed 's/,[ ]*/\n/g'
