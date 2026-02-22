#!/bin/sh

#指定文件路径
FILE="/usr/share/rpcd/ucode/luci"

#添加NSS状态显示
sed -i "s#const fd = popen('top -n1 | awk \\\'/^CPU/ {printf(\"%d%\", 100 - \$8)}\\\'')#const fd = popen(access('/sbin/cpuusage') ? '/sbin/cpuusage' : 'top -n1 | awk \\\'/^CPU/ {printf(\"%d%\", 100 - \$8)}\\\'')#g" $FILE

#锁定NPU频率
sysctl -w dev.nss.clock.auto_scale='0'

exit 0