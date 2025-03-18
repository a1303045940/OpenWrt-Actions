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




# 自定义软件源
git clone --depth 1 -b main https://github.com/QiYueYiya/openwrt-packages package/openwrt-packages
# Mosdns
# 移除要替换的包
rm -rf feeds/packages/lang/golang
# golong1.24依赖
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

# rm -rf feeds/packages/net/v2ray-geodata
# git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
# git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
# Easytier
git clone --depth 1 -b main https://github.com/EasyTier/luci-app-easytier.git luci-app-easytier
mv luci-app-easytier/easytier package/easytier
mv luci-app-easytier/luci-app-easytier package/luci-app-easytier
rm -rf luci-app-easytier
# 科学上网插件
rm -rf {*passwall*,*bypass*,*homeproxy*,*mihomo*}
# rm -rf feeds/packages/lang/golang
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}

##添加自己的插件库
git clone --depth 1 -b main https://github.com/xiaorouji/openwrt-passwall-packages.git luci-app
mv luci-app/openwrt-passwall package/openwrt-passwall
rm -rf openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
# git clone https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2

#git clone https://github.com/sbwml/luci-app-mosdns.git package/mosdns
#git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
#git clone https://github.com/tty228/luci-app-wechatpush.git package/luci-app-serverchan
#git clone https://github.com/firkerword/luci-app-lucky.git package/lucky
# git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky
#chmod 755 ./package/lucky/luci-app-lucky/root/usr/bin/luckyarch
#git clone https://github.com/linkease/istore.git package/istore
# sed -i '$a src-git mzwrt_package https://github.com/mzwrt/mzwrt_package' feeds.conf.default
# git clone --depth 1 -b main https://github.com/mzwrt/mzwrt_package package/openwrt-packages

