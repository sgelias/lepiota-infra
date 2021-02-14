#!/bin/bash

while [ ! -f /var/lib/cloud/instance/boot-finished ]; do
    echo "Waiting fro cloud init..."
    sleep 1
done

sudo apt-get update
sudo apt-get install -y python python-pip
