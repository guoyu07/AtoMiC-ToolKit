#!/bin/bash
# Script Name: AtoMiC Integration Test bashate check
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# Find double New Lines at the end of files
if [[ $(find . -type f -exec sh -c '[ -z "$(sed -n "\$p" "$1")" ]' _ {} \; -print | wc -l) -gt 0 ]]; then
    find . -type f -exec sh -c '[ -z "$(sed -n "\$p" "$1")" ]' _ {} \; -print
    echo "Test1"
    FOUND=1
fi

# Find missing New Lines
if [[ $(pcregrep --exclude_dir='.git|backups' -LMr '\n\Z' . | wc -l) -gt 0 ]]; then
    pcregrep --exclude_dir='.git|backups' -LMr '\n\Z' .
        echo "Test2"
    FOUND=1
fi

if [[ -n $FOUND ]]; then
    exit 1
fi