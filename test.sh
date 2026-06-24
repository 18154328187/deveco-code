#!/bin/bash
set -e

# 测试目录路径
TEST_DIR="./packages/opencode/test"

# 判断目录是否存在
if [ ! -d "$TEST_DIR" ]; then
  echo "错误：目录 $TEST_DIR 不存在"
  exit 1
fi

# 查找目录下所有 test.ts 文件并依次执行
echo "开始遍历执行所有 test.ts 文件..."
find "$TEST_DIR" -type f -name "*test.ts" | while read -r ts_file
do
  echo "====================================="
  echo "正在执行：$ts_file"
  echo "====================================="
  npx ts-node "$ts_file"
  echo "[$ts_file] 执行完成\n"
done

echo "所有测试文件执行完毕！"
