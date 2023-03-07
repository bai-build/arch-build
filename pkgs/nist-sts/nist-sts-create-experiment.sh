#!/bin/sh

mkdir -p experiments && cd experiments

for dname in AlgorithmTesting BBS CCG G-SHA1 LCG MODEXP MS QCG1 QCG2 XOR ; do
    mkdir -p $dname/Frequency
    mkdir -p $dname/BlockFrequency
    mkdir -p $dname/Runs
    mkdir -p $dname/LongestRun
    mkdir -p $dname/Rank
    mkdir -p $dname/FFT
    mkdir -p $dname/NonOverlappingTemplate
    mkdir -p $dname/OverlappingTemplate
    mkdir -p $dname/Universal
    mkdir -p $dname/LinearComplexity
    mkdir -p $dname/Serial
    mkdir -p $dname/ApproximateEntropy
    mkdir -p $dname/CumulativeSums
    mkdir -p $dname/RandomExcursions
    mkdir -p $dname/RandomExcursionsVariant
done
