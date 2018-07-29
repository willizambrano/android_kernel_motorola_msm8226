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
make clean && make mrproper

export CROSS_COMPILE=/home/joker/q6.4/bin/arm-eabi-
export ARCH=arm
export KBUILD_BUILD_USER="WilliamZambrano"
export KBUILD_BUILD_HOST="LinuxLite"

make falcon_defconfig
echo -e "$blue*****************************************************"
echo "           Compilando Evolution_Kernel         "
echo -e "*****************************************************$nocol"

make -o3 -j2 CONFIG_DEBUG_SECTION_MISMATCH=y CONFIG_NO_ERROR_ON_MISMATCH=y

BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo -e "$yellow Kernel compilado en $(($DIFF / 60)) minuto(s) y $(($DIFF % 60)) segundos.$nocol"
