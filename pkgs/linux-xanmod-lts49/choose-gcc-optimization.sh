#!/usr/bin/env bash

. /usr/share/makepkg/util/message.sh
colorize

Detect_CPU=$(gcc -c -Q -march=native --help=target | grep march | awk '{print $2}')

msg "Detected CPU architecture: $Detect_CPU"

cat << EOF

    Available CPU microarchitectures:

    1) AMD old K8-family    
    2) AMD Improved K8-family (SSE3)
    3) AMD K10-family
    4) AMD Family 10h (Barcelona)
    5) AMD Family 14h (Bobcat)
    6) AMD Family 16h (Jaguar)
    7) AMD Family 15h (Bulldozer)
    8) AMD Family 15h (Piledriver)
    9) AMD Family 15h (Steamroller)
    10) AMD Family 15h (Excavator)
    11) AMD Family 17h (Zen)

    12) Intel P4 / older Netburst based Xeon (Core2)        
    13) Intel Bonnell family of low-power Atom processors (Bonnell)
    14) Intel Silvermont family of low-power Atom processors (Silvermont)
    15) Intel 1st Gen Core i3/i5/i7-family (Nehalem)
    16) Intel 1.5 Gen Core i3/i5/i7-family (Westmere)
    17) Intel 2nd Gen Core i3/i5/i7-family (Sandybridge)
    18) Intel 3rd Gen Core i3/i5/i7-family (Ivybridge)
    19) Intel 4th Gen Core i3/i5/i7-family (Haswell)
    20) Intel 5th Gen Core i3/i5/i7-family (Broadwell)
    21) Intel 6th Gen Core i3/i5/i7-family (Skylake)

    22) Native optimizations autodetected by GCC

    0) Generic (default)
    
EOF

sleep 1
answer=$1

case $answer in
    1) Microarchitecture=CONFIG_MK8 ;;
    2) Microarchitecture=CONFIG_MK8SSE3 ;;
    3) Microarchitecture=CONFIG_MK10 ;;
    4) Microarchitecture=CONFIG_MBARCELONA ;;
    5) Microarchitecture=CONFIG_MBOBCAT ;;
    6) Microarchitecture=CONFIG_MJAGUAR ;;
    7) Microarchitecture=CONFIG_MBULLDOZER ;;
    8) Microarchitecture=CONFIG_MPILEDRIVER ;;
    9|10|11) Microarchitecture=CONFIG_MNATIVE ;;   # Xanmod doesn't include those architectures!! Switch to native instead
    12) Microarchitecture=CONFIG_MPSC ;;
    13) Microarchitecture=CONFIG_MATOM ;;
    14) Microarchitecture=CONFIG_MSILVERMONT ;;
    15) Microarchitecture=CONFIG_MNEHALEM ;;
    16) Microarchitecture=CONFIG_MWESTMERE ;;
    17) Microarchitecture=CONFIG_MSANDYBRIDGE ;;
    18) Microarchitecture=CONFIG_MIVYBRIDGE ;;
    19) Microarchitecture=CONFIG_MHASWELL ;;
    20) Microarchitecture=CONFIG_MBROADWELL ;;
    21) Microarchitecture=CONFIG_MNATIVE ;;    # Xanmod doesn't include this architecture!! Switch to native instead
    22) Microarchitecture=CONFIG_MNATIVE ;;
    *) default=CONFIG_GENERIC_CPU ;;
esac

warning "According to PKGBUILD variable _microarchitecture, your choice is $answer"
msg "Building this package for microarchitecture: $Microarchitecture$default"
sleep 5

sed -e 's|^CONFIG_GENERIC_CPU=y|# CONFIG_GENERIC_CPU is not set|g' -i .config
sed -e "s|^# $Microarchitecture is not set|$Microarchitecture=y|g" -i .config

echo
