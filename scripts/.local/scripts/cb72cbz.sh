#!/bin/sh

folder=$(cd "${1:-.}" || exit 1; pwd)

printf "folder : %s\n" "$folder"

cd "$folder" || exit 4

for f in "$folder"/*.cb7; do
  filename=$(printf "%s" "$f" | sed s/\.cb7$//g)
  printf "file: %s\n" "$f"
  printf "name: %s\n" "$filename"
  7zz x "$f" -o"$filename" || exit 6
  cd "$filename" || exit 5 
  zip -rm "$filename.cbz" ./* || exit 8
  cd "$folder" || exit 4
  rm -rf "$filename"
  rm -f "$f"
done
