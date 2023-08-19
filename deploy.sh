#!/bin/bash

# Author - Atul Sutar
# Created Date - 19 Aug 2023

# Color Variables
YELLOW='\033[1;33m'
NC='\033[0m'
GREEN='\033[0;32m'
RED='\033[0;31m'

# General Variables
PWD=$(pwd)

# Required Variables
SERVICE=$(echo "$1" | cut -d ":" -f 1)

# Registry Tag Path
REGISTRYPATH="<add-your-registry-path>"
DEPLOYREGION="<add-your-region>"

echo -e "\n"
echo -e "${YELLOW} [+] Work Directory is :- ${PWD}${NC}"
echo -e "${YELLOW} [+] Service Name is   :- ${SERVICE}${NC}"
echo -e "${YELLOW} [+] Tag Name is       :- ${REGISTRYPATH}/$1${NC}"

echo -e "\n"
echo -e "${YELLOW} [+] Started Building Container ${NC}"
echo -e "${YELLOW} [*] Please Wait While Container is Being Built...${NC}"

echo -e "\n"
# Time Container Build
START=$(date +%s)

# Build Command
gcloud builds submit --tag=${REGISTRYPATH}/$1 --quiet &>> /dev/null
CHECK=$(echo $?)

END=$(date +%s)

if [ $CHECK -eq 0 ]
then
    echo -e "\n"
    echo -e "${YELLOW} [+] Container Built Successfully ${NC}"
    echo -e "${YELLOW} [+] Container Build Time :- $(expr $END - $START) Seconds ${NC}"
    echo -e "${YELLOW} [+] Routing Traffic to New Revision ${NC}"
    # Deploy Command
    gcloud run deploy $SERVICE --region=${DEPLOYREGION} --image=${REGISTRYPATH}/$1 --quiet
    echo -e "${YELLOW} [+] New Revision Deployed and Running ${NC}"
else
    echo -e "\n"
    echo -e "${RED} [-] Container Build Process Failed ${NC}"
    echo -e "${RED} [-] Please Check Previous Command ${NC}"
fi

# End
