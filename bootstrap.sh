#!/bin/bash
echo "ubuntu:ubuntu" | sudo chpasswd
apt-get install ansible sshpass -y
