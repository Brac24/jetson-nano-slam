#!/bin/bash

# This launches the realsense node using the legacy realsense-ros wrapper syntax (i.e. realsense-ros v2.48.0)
# This configuration of realsense publishes the infrared stereo camera images
# Using this configuration was inspired by how well rtabmap builds a 3D map using the euroc-mav dataset
# An issue on the rtabmap_ros repo on github here https://github.com/introlab/rtabmap_ros/issues/565
# Also suggests to us IR camera images for odometry
ros2 launch realsense2_camera rs_launch.py align_depth:=false enable_depth:=false linear_accel_cov:=1.0 \
enable_accel:=true enable_gyro:=true unite_imu_method:=linear_interpolation \
infra_width:=640 infra_height:=360 infra_fps:=30.0 \
color_width:=640 color_height:=360 color_fps:=30.0 # depth_width:=640 depth_height:=360 depth_fps:=30.0