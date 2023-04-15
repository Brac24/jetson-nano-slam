#!/bin/bash

# This script launches the realsense node. This uses the new realsense-ros wrapper syntax for parameters (such as depth_module.profile)
ros2  launch realsense2_camera rs_launch.py align_depth:=true linear_accel_cov:=1.0 \
enable_accel:=true enable_gyro:=true unite_imu_method:=2 \
rgb_camera.profile:=640x360x30 depth_module.profile:=640x360x30