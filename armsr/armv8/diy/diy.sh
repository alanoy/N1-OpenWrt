#!/bin/bash

# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch

# Clone packages
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic
git clone https://github.com/QiuSimons/luci-app-daed clone/daed
git clone https://github.com/Zerogiven-OpenWRT-Packages/luci-app-podman --depth=1 feeds/luci/applications/luci-app-podman

# Add nikki feed
echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> feeds.conf.default

# Adjust packages
rm -rf feeds/luci/applications/luci-app-daed feeds/luci/applications/luci-app-passwall
cp -rf clone/amlogic/luci-app-amlogic clone/daed/luci-app-daed clone/passwall/luci-app-passwall feeds/luci/applications/
sed -i '/luci-app-attendedsysupgrade/d' feeds/luci/collections/luci/Makefile

# Clean packages
rm -rf clone