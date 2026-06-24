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

# 使用 bun test 运行整个测试目录
echo "开始执行测试..."
echo "====================================="
bun test "$TEST_DIR"
echo "====================================="
echo "所有测试执行完毕！"
