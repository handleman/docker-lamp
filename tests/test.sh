#!/bin/bash
source _helpers.sh

echo
echo "Testing mattrayner/lamp"
echo "=> Sleeping to allow boot of containers"
sleep 15

echo
echo "=> Testing 18.04 images"
. 1804.sh
