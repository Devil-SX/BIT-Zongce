#!/usr/bin/bash
rm original -rf
mkdir ./original

for file in ./zip/*
do
    echo "[INFO]Original File $file"
    basename=$(basename "$file")
    filename="${basename%.*}"
    dir="./original/$filename"
    echo "[INFO] Destination Dir $dir"
    mkdir -p "$dir"
    7z x -y  "$file"  "-o$dir"
done
