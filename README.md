# BIT 综测统计 自动化脚本

    本仓库仅在北京理工大学信息电子学院20级电子信息实验班综测统计工作中使用过，如果是其他学院年级，脚本可能需要做相应调整

这是一个用于北京理工大学综合测评统计工作的工具仓库。传统的综测统计工作通常需要各班班委人工收集同学的综测材料，统一文件命名风格，以及汇总表格。

我在工作过程中写了这些脚本帮助部分工作自动化。

```
班级汇总文件夹样例/
├── （2023-2版）2020级表2：北京理工大学信息与电子学院个人及班级综测成绩汇总版.xlsx
└── 2xxx班综测材料
    └── xx班-表1汇总
        └── 张三+学号（含表1和证明材料）
            ├── （2023-2版）2020级表1：北京理工大学信息与电子学院综合测评表.xlsx
            └── （2023-2版）2020级表2：北京理工大学信息与电子学院个人及班级综测成绩汇总版.xlsx
            └── B1-1.jpg
            └── C1-1.jpg
            └── ...
```

# Environments

- Shell 执行环境
- Python+openpyxl
- 7zip 命令行工具（负责解压同学们提交的压缩包，可以用其他命令替代 `extract.sh` 中的解压步骤）

# Get Started

告知同学们的压缩包按`姓名+学号`命名。

## 收集压缩包

仓库目录下创建`zip`文件夹，将同学们的压缩包放在zip文件夹内。

## 生成中间文件

Shell 进入仓库目录

在Shell环境内执行以下命令

```
./extract.sh # 需要 7zip 工具
./folder_process.sh
./fix_gibberish.sh
./fix_name.sh
```

如果运行正常，可以看到生成了 `original`,`process_1`,`process_2`,`process_3`文件夹

## 生成最终文件

将`process_3` 复制一份，重命名为`process_4`。 **人工校对一下文件结构和命名格式是否符合标准**

修改 `final_prepare.sh` 脚本中 `class_id` 变量，改为统计的班级号。

```
./final_prepare.sh
```

应该可以看到生成了符合最终提交结构的文件夹结构 `xxxxx班材料`

修改 `summerize.py` 中 `class_id` 变量

```
python ./summerize.py
```

生成班级汇总的表格，最后再**人工添加一下表头调整一下格式**，勘误材料。

更多脚本[说明](./doc.md)。

