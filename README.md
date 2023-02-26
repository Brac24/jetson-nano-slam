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