#!/bin/bash

# This command will record all necessary realsense messages needed for rtabmap
# this skips recording compressed image messages because those are not used and
# have experienced issues when replaying the compressed image messages.
ros2 bag record /camera/accel/imu_info /camera/aligned_depth_to_color/camera_info \
/camera/aligned_depth_to_color/image_raw /camera/color/camera_info /camera/color/image_raw \
/camera/color/metadata /camera/depth/camera_info /camera/depth/image_rect_raw \
/camera/depth/metadata /camera/extrinsics/depth_to_color /camera/gyro/imu_info \
/camera/imu /diagnostics /parameter_events /rosout /tf /tf_static