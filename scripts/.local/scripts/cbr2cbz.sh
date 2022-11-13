#!/bin/sh

folder=$(cd "${1:-.}" || exit 1; pwd)

printf "folder : %s\n" "$folder"

cd "$folder" || exit 4

for f in "$folder"/*.cbr; do
  filename=$(printf "%s" "$f" | sed s/\.cbr$//g)
  printf "file: %s\n" "$f"
  printf "name: %s\n" "$filename"
  unrar x "$f" || exit 6
  cd "$filename" || exit 5 
  zip -rm "$filename.cbz" ./* || exit 8
  cd "$folder" || exit 4
  rm -rf "$filename"
  rm -f "$f"
done
