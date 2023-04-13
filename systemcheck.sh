#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "Checking for broken packages..."
if [ $(dpkg -l | grep "^..r" | wc -l) -ne 0 ]; then
    echo -e "${RED}There are broken packages on the system.${NC}"
else
    echo -e "${GREEN}No broken packages found.${NC}"
fi

echo -e "Checking for available updates..."
if [ $(sudo apt list --upgradable --no-upgrade 2>/dev/null | wc -l) -ne 0 ]; then
    echo -e "${RED}There are updates available that have not been installed.${NC}"
else
    echo -e "${GREEN}No updates available.${NC}"
fi

echo -e "Checking system log for errors..."
if [ $(sudo grep -i error /var/log/syslog /var/log/dmesg | wc -l) -ne 0 ]; then
    echo -e "${RED}There are errors in the system log.${NC}"
else
    echo -e "${GREEN}No errors found in the system log.${NC}"
fi

echo -e "${GREEN}System check complete.${NC}"

