#!/bin/bash

. ./scripts/funcations.sh

# Clone source code
clone_repo $immortalwrt_repo openwrt-23.05 openwrt &
clone_repo $openwrt_repo openwrt-22.03 openwrt_22 &
clone_repo $lede_pkg_repo master lede_pkg &
clone_repo $mosdns_repo v5 mosdns &
clone_repo $mosdns_pkg master mosdns_pkg &
clone_repo $sirpdboy_repo main sirpdboy &

wait

# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' openwrt/package/base-files/files/etc/shadow
# Modify default IP (FROM 192.168.1.1 CHANGE TO 192.168.1.99 )
sed -i 's/192.168.2.1/192.168.2.3/g' openwrt/package/base-files/files/bin/config_generate

exit 0
