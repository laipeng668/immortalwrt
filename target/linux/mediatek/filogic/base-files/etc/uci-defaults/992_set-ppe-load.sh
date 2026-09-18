#!/bin/sh

#指定文件路径
FILE="/usr/share/rpcd/ucode/luci"

# 添加PPE状态显示。保留脚本直到 LuCI 文件和目标代码都可用，避免首次启动时
# LuCI 尚未安装导致脚本被删除而永远不会生效。
[ -f "$FILE" ] || exit 1

grep -Fq "const fd = popen('/sbin/cpuusage')" "$FILE" && exit 0
grep -Fq "const fd = popen('top" "$FILE" || exit 1

sed -i "s#const fd = popen('top.*')#const fd = popen('/sbin/cpuusage')#g" "$FILE" || exit 1

exit 0
