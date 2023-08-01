#!/usr/bin/bash
rm -rf process_3
cp process_2 -r process_3
cd process_3


for student_dir in ./*; do
# if is dir, entering it
    if [ -d "$student_dir" ]; then
        cd "$student_dir"
            for file in ./*; do
                base_name=$(basename $file)
                echo "$base_name"
                if [[  "$base_name" == 证明材料* ]]; then # 这里证明材料不能加引号，否则会被当成字符串
                    echo "found $base_name"
                    newname="${base_name#证明材料}" # remove prefix
                    mv "$file" "$newname"
                fi
            done
        cd ..
    fi
done




