#!/bin/sh

FILE="/usr/share/rpcd/ucode/luci"

[ -f "$FILE" ] || exit 0
grep -q "/sbin/cpuusage" "$FILE" && exit 0

sed -i "s#const fd = popen('top -n1 | awk \\\'/^CPU/ {printf(\"%d%\", 100 - \$8)}\\\'')#const fd = popen(access('/sbin/cpuusage') ? '/sbin/cpuusage' : 'top -n1 | awk \\\'/^CPU/ {printf(\"%d%\", 100 - \$8)}\\\'')#g" "$FILE"

exit 0
