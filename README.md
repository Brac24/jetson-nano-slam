# jetson-nano-slam
My CSUN Masters Graduate Project

Currently have a working base docker image with RTAB-Map built from source for ROS 2 called ros-foxy-rtabmap-jetpack5 on my machine.
When opening that container I do need to edit the LD_LIBRARY_PATH to add /opt/ros/foxy/lib to it.

The most current librealsense 2.51.1 seems to break the IMU on the D455 when running on the Jetson Nano.
The last compatible version is librealsense v2.48.0. I have this installed on the cart image but not on the cart-slamv2 image.
Docker images I build should probably only use librealsense v2.48.0 from here on out. We need IMU to use imu_filter_madwick.
It is not a requirement because RTAB-Map can do RGB-D Odometry but it's an added odometry input that would help the robot from getting lost.

To build the docker image run:
./scripts/dockerbuild-arm64.sh name-your-container docker/Dockerfile.ros.foxy.mine

Replace name-your-container with any name you want to give the container
Replace docker/Dockerfile.ros.foxy.mine with the path to your dockerfile you want to use to build the image.

# High Level Docker Architecture
![image](https://user-images.githubusercontent.com/4980091/221400551-7024b5c9-71b8-4bbb-9c06-b85788337192.png)
There are currently two systems: cart and cart-slamv2.
cart shows that there are two containers running. The cart/slam container runs the realsense node and imu_filter_madwick for the D455 camera.
This was tested to work and does produce an acceptable SLAM map we can visualize in rviz2.
cart-slamv2 has a container that can run the realsense node but it uses librealsense v2.51.1 which breaks the D455 IMU on Jetson Nano. We need to
build a new image that uses librealsense v2.48.0 instead which has been verified to work on Jetson Nano.

# Images of Tests Ran with the cart System
![Screenshot from 2023-02-25 14-54-37](https://user-images.githubusercontent.com/4980091/221400768-a3ab6c6b-e431-4b2c-a4e4-f4b6d8257c45.png)
