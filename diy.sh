#!/bin/bash

# Add packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic
git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git --depth=1 clone/luci-app-unblockneteasemusic

# Add nikki feed
echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> feeds.conf.default

# Update packages
cp -fr clone/amlogic/luci-app-amlogic feeds/luci/applications/
cp -fr clone/luci-app-unblockneteasemusic feeds/luci/applications/

# Clean packages
rm -rf clone
