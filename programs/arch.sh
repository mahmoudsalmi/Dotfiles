#!/bin/sh

# TODO: install paru

# sed -e "s/#.*$//" -e "s/\s*$//"  -e "/^\s*$/d" ./arch/pkglist.txt | xargs -I {} sh -c "sudo pacman -S --confirm --needed {}"
sudo pacman -S --needed $(sed -e "s/#.*$//" -e "s/\s*$//"  -e "/^\s*$/d" ./arch/pkglist.txt | tr '\n' ' ')
paru -S --needed $(sed -e "s/#.*$//" -e "/^\s*$/d" -e "/^\s*$/d" ./arch/pkglist-aur.txt | tr '\n' ' ')

