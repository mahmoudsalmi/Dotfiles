#!/bin/sh

### 01 - Add Repo
sudo sh ./apt/server-01-repo
sudo apt update
sudo apt upgrade

### 02 - Install [APT]
sudo sh ./apt/server-02-pkglist

### 03 - Install [snaps]
sudo sh ./apt/server-03-snaps

### 04 - Services
sudo sh ./apt/server-04-services

### 05 - Post-install
sudo sh ./apt/server-05-postinstall
