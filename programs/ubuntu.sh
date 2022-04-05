#!/bin/sh

### 01 - Add Repo
sudo sh ./ubuntu/server-01-repo
sudo apt update
sudo apt upgrade

### 02 - Install [APT]
sudo sh ./ubuntu/server-02-pkglist

### 03 - Install [snaps]
sudo sh ./ubuntu/server-03-snaps

### 04 - Services
sudo sh ./ubuntu/server-04-services

### 05 - Post-install
sh ./ubuntu/server-05-postinstall
