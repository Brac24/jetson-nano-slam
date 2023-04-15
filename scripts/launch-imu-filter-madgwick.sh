#!/bin/bash

ros2 run imu_filter_madgwick imu_filter_madgwick_node \
--ros-args -p use_mag:=false -p _publish_tf:=false -p _world_frame:="enu" -r /imu/data_raw:=/camera/imu