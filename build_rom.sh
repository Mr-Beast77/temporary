# sync rom
repo init --depth=1 -u git://github.com/AospExtended/manifest.git -b 11.x -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/Apon77Lab/android_.repo_local_manifests.git --depth 1 -b aex .repo/local_manifests --depth=1
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all) vendor/aosp

# build rom
source build/envsetup.sh
lunch aosp_mido-user
m bootimage

# upload rom
rclone copy out/target/product/mido/AospExtended*.zip cirrus:mido -P
