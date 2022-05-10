#!/bin/sh

### 01 - Add Repo
sudo sh ./deb/server-01-repo
sudo apt update
sudo apt upgrade

### 02 - Install [APT]
sudo sh ./deb/server-02-pkglist

### 03 - Install [snaps]
sudo sh ./deb/server-03-snaps

### 04 - Services
sudo sh ./deb/server-04-services

### 05 - Post-install
sh ./deb/server-05-postinstall
