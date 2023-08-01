#!/usr/bin/bash
rm process_1 -rf
cp original -r process_1
cd process_1


for student_dir in ./*; do
# if is dir, entering it
    if [ -d "$student_dir" ]; then
        cd "$student_dir"

        # 寻找当前目录下的所有文件夹
        while IFS= read -r -d '' folder; do
            # 跳过当前目录（表示为.）和上级目录（表示为..）
            if [[ "$folder" != "." && "$folder" != ".." ]]; then
                # 移动文件夹内的所有文件到当前目录
                find "$folder" -maxdepth 1 -mindepth 1 -print0 | xargs -0 mv -t .
                # 删除空的文件夹
                rmdir "$folder"
            fi
        done < <(find . -maxdepth 1 -type d -print0)

        cd ..
    fi
done
