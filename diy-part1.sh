#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git NueXini_Packages https://github.com/NueXini/NueXini_Packages.git' >>feeds.conf.default
echo 'src-git kenzok8_packages https://github.com/kenzok8/openwrt-packages.git' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small.git' >>feeds.conf.default

git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff
git clone https://github.com/AlexZhuo/luci-app-bandwidthd.git package/lean/luci-app-bandwidthd
git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb

# default on dhcp.lan.force
sed -i '/exit 0/d' package/lean/default-settings/files/zzz-default-settings
echo 'uci set dhcp.lan.force=1' >>package/lean/default-settings/files/zzz-default-settings
echo 'uci commit dhcp' >>package/lean/default-settings/files/zzz-default-settings
echo 'exit 0' >>package/lean/default-settings/files/zzz-default-settings
