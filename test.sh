#!/bin/bash
set -euo pipefail

# Skip native module loading in test environment
export SKIP_MCP_NATIVE_BRIDGE="true"

# 测试目录路径
TEST_DIR="./packages/opencode/test"

# 判断目录是否存在
if [ ! -d "$TEST_DIR" ]; then
  echo "错误：目录 $TEST_DIR 不存在"
  exit 1
fi

# 检查 bun 是否可用
if ! command -v bun &> /dev/null; then
  echo "[ERROR] 未检测到 bun 运行时，请先安装 bun"
  exit 1
fi

# 查找目录下所有 test.ts 文件并依次执行
echo "开始遍历执行所有 test.ts 文件..."
find "$TEST_DIR" -type f -name "*test.ts" | while read -r ts_file
do
  echo "====================================="
  echo "正在执行：$ts_file"
  echo "====================================="
  bun run "$ts_file"
  echo "[$ts_file] 执行完成\n"
done

echo "所有测试文件执行完毕！"
