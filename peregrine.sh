#!/bin/bash
# Simple Kernel script compiler
#

BUILD_START=$(date +"%s")
blue='\033[0;34m'
cyan='\033[0;36m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'

# Init Fields
QS_V_MAJOR=1
QS_V_MINOR=0
QS_VERSION=v$QS_V_MAJOR.$QS_V_MINOR
QS_DATE=$(date +%Y%m%d)
QS_TOOLCHAIN=/home/joker/q6.4/bin/arm-eabi-

echo -e "$yellow*****************************************************"
echo "                Cleaning source         "
echo -e "*****************************************************$nocol"

rm -rf arch/arm/boot/*.dtb
make clean && make mrproper

export CROSS_COMPILE=$QS_TOOLCHAIN
export ARCH=arm
export KBUILD_BUILD_USER="WilliamZambrano"
export KBUILD_BUILD_HOST="LinuxLite"
export LOCALVERSION=-Cerberus_Kernel-$QS_VERSION-$QS_DATE

make peregrine_defconfig
echo -e "$blue*****************************************************"
echo "           Building Metis_Kernel         "
echo -e "*****************************************************$nocol"

make -o3 -j2 CONFIG_DEBUG_SECTION_MISMATCH=y CONFIG_NO_ERROR_ON_MISMATCH=y

BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo -e "$yellow Kernel compilado en $(($DIFF / 60)) minuto(s) y $(($DIFF % 60)) segundos.$nocol"
