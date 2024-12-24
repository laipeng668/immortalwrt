# 自用高通版 ImmortalWRT
高通部分源码取自以下项目：

https://github.com/JiaY-shi/openwrt.git

https://github.com/qosmio/openwrt-ipq.git

https://github.com/LiBwrt-op/openwrt-6.x.git

https://github.com/King-Of-Knights/openwrt-6.x.git

https://github.com/VIKINGYFY/immortalwrt.git

更新说明：

由于本仓库采用的是rebase方式更新，所以git pull不适用于本地仓库同步更新。

git remote add roc https://github.com/laipeng668/immortalwrt

git fetch roc

git pull --rebase

或者

git reset --hard roc/openwrt-24.10
