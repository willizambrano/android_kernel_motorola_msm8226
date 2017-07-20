#!/bin/bash
# Compiler Powered_by_AMDfx6300
#

BUILD_START=$(date +"%s")
blue='\033[0;34m'
cyan='\033[0;36m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'

echo -e "$yellow*****************************************************"
echo "                 Borrando basura         "
echo -e "*****************************************************$nocol"

rm -rf arch/arm/boot/*.dtb
rm -f /home/william/android_kernel_motorola_msm8226/arch/arm/boot/zImage-dtb
rm -f /home/william/android_kernel_motorola_msm8226/arch/arm/boot/zImage
make clean && make mrproper

export CROSS_COMPILE=/home/william/linaro4.9/bin/arm-cortex_a7-linux-gnueabihf-
export ARCH=arm
export KBUILD_BUILD_USER="WilliamZambrano"
export KBUILD_BUILD_HOST="AMDfx6300"

make falcon_defconfig
make menuconfig
echo -e "$blue*****************************************************"
echo "           Compilando Evolution_Kernel         "
echo -e "*****************************************************$nocol"

make -o3 -j6 CONFIG_DEBUG_SECTION_MISMATCH=y CONFIG_NO_ERROR_ON_MISMATCH=y

mv /home/william/android_kernel_motorola_msm8226/arch/arm/boot/zImage-dtb /home/william/android_kernel_motorola_msm8226/Evolution_Kernel/boot

BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo -e "$yellow Kernel compilado en $(($DIFF / 60)) minuto(s) y $(($DIFF % 60)) segundos.$nocol"
