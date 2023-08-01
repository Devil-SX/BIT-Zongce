#!/usr/bin/bash
rm process_2 -rf
cp process_1 -r process_2
cd process_2

glib_str1="��2023-2�棩2020����1�����������ѧ��Ϣ�����ѧԺ�ۺϲ�����.xlsx"
glib_str2="��2023-2�棩2020����2�����������ѧ��Ϣ�����ѧԺ���˼��༶�۲�ɼ����ܰ�.xlsx"
dest_str1="（2023-2版）2020级表1：北京理工大学信息与电子学院综合测评表.xlsx"
dest_str2="（2023-2版）2020级表2：北京理工大学信息与电子学院个人及班级综测成绩汇总版.xlsx"


for student_dir in ./*; do
# if is dir, entering it
    if [ -d "$student_dir" ]; then
        cd "$student_dir"
        for file in ./*; do
            # $file should be like "./xxxx.xlsx"
            base_name=$(basename $file)
            echo "$base_name"
            if [[ $base_name ==  $glib_str1 ]]; then
                mv "$file" "$dest_str1"
                echo "moved $file to $dest_str1"
            elif [[ $base_name == $glib_str2 ]]; then
                mv "$file" "$dest_str2"
                echo "moved $file to $dest_str2"
            fi
        done
        cd ..
    fi
done
