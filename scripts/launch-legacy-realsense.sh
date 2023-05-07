#!/bin/bash

# This launches the realsense node using the legacy realsense-ros wrapper syntax (i.e. realsense-ros v2.48.0)
ros2 launch realsense2_camera rs_launch.py align_depth:=true linear_accel_cov:=1.0 \
enable_accel:=true enable_gyro:=true unite_imu_method:=linear_interpolation \
color_width:=640 color_height:=360 color_fps:=30.0 depth_width:=640 depth_height:=360 depth_fps:=30.0