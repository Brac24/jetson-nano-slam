#!/usr/bin/env bash

target_platform='tegra'
target_platform_count=$(uname -r | grep -c $target_platform ) # Check if we are running on Jetson if it kernel platform contains the word tegra

if [ $target_platform_count -gt 0 ]; then
# Run this script on the Jetson Nano before trying to profile with Nsight Systems
    if [ $(cat /proc/sys/kernel/perf_event_paranoid) -gt 2]; then # if this file contains a value greater than 2 the reduce it to allow Nsight Systems to work properly
        sudo sh -c 'echo 2 >/proc/sys/kernel/perf_event_paranoid'
    else
        echo "perf_even_paranoid already set with a value less than 2 and ready for profiling"
    fi
else
    echo "Not Running on Correct Platform. Need to run this script on a Jetson Platform"
fi