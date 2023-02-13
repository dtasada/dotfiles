#!/bin/bash
echo -n "Enter clone address: "
read CLONEADDRESS
git clone https://github.com/$CLONEADDRESS/
