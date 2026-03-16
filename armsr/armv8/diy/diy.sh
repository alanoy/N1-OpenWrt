#!/bin/bash

# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch

# Clone packages
git clone https://github.com/nantayo/My-Pkg clone/my-pkg
git clone https://github.com/ophub/luci-app-amlogic --depth=1 clone/amlogic

git clone https://github.com/Zerogiven-OpenWRT-Packages/luci-app-podman --depth=1 feeds/luci/applications/luci-app-podman

# Add nikki feed
echo "src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main" >> feeds.conf.default

# Adjust packages
cp -fr clone/amlogic/luci-app-amlogic feeds/luci/applications/
cp -rf clone/my-pkg/haproxy feeds/packages/net/
cp -rf clone/my-pkg/podman feeds/packages/utils/
sed -i '/luci-app-attendedsysupgrade/d' feeds/luci/collections/luci/Makefile

# Clean packages
rm -rf clone