#!/bin/bash
# Compiler Powered_by_AMDfx6300
#

BUILD_START=$(date +"%s")
blue='\033[0;34m'
cyan='\033[0;36m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'

echo -e "Borrando basura"
make clean && make mrproper

export CROSS_COMPILE=/home/william/linaro4.9/bin/arm-eabi-
export ARCH=arm
export KBUILD_BUILD_USER="WilliamZambrano"
export KBUILD_BUILD_HOST="AMDfx6300"

make titan_defconfig
make menuconfig
echo -e "$yellow*****************************************************"
echo "       Compilando Evolution_Kernel         "
echo -e "*****************************************************$nocol"

make -o3 -j6 CONFIG_DEBUG_SECTION_MISMATCH=y CONFIG_NO_ERROR_ON_MISMATCH=y

BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo -e "$yellow Construcción completada en $(($DIFF / 60)) minuto(s) y $(($DIFF % 60)) segundos.$nocol"
