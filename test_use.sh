#!/bin/bash
mkdir build
cd build
cmake ..
make
cd ..
#绝对路径
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#子目录
target_dir="$script_dir/tests/func"

#新文件
output_dir="$script_dir/outputOFLAB"
output_dir1="$script_dir/outputOFsyntaxtree"
mkdir -p "$output_dir"
mkdir -p "$output_dir1"
# 输出文件名
find "$target_dir" -type f -name "*.sy" -exec basename {} \; | while read -r filename; do
   # 去掉.sy
    base_name="${filename%.sy}"

    #build
    ./build/lexer "$target_dir/$filename" > "$output_dir/$base_name.txt"
    ./build/parser "$target_dir/$filename" > "$output_dir1/$base_name.txt"

done

