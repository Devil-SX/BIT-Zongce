#!/usr/bin/bash

class_id="05962007"

source_dir="./process_4"
root_dir="./${class_id}班材料"
summer_dir="${root_dir}/${class_id}班综测材料/${class_id}班-表1汇总"
summerize_excel="${root_dir}/（2023-2版）2020级表2：北京理工大学信息与电子学院个人及班级综测成绩汇总版.xlsx"

rm -rf "${root_dir}"
mkdir "${root_dir}"
cp -r "${source_dir}" "${summer_dir}"
