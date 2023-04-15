# jetson-nano-slam
My CSUN Masters Graduate Project

Currently have a working base docker image with RTAB-Map built from source for ROS 2 called ros-foxy-rtabmap-jetpack5 on my machine.
When opening that container I do need to edit the LD_LIBRARY_PATH to add /opt/ros/foxy/lib to it.

The most current librealsense 2.51.1 seems to break the IMU on the D455 when running on the Jetson Nano.
The last compatible version is librealsense v2.48.0. I have this installed on the cart image but not on the cart-slamv2 image.
Docker images I build should probably only use librealsense v2.48.0 from here on out. We need IMU to use imu_filter_madwick.
It is not a requirement because RTAB-Map can do RGB-D Odometry but it's an added odometry input that would help the robot from getting lost.

# Available Docker Images
Currently there are 2 docker files. One docker file bulds off of the Ubuntu 20.04 JetPack 5.02 image for newer Jetson devices provided by Nvidia.  The other image is based on the Jetpack 4.6.1 which uses Ubuntu 18.04. Both images have the ROS 2 framework installed. The Ubuntu 18 based image takes a while to build since it builds a lot of software from source because ROS 2 Foxy package are not available for Ubuntu 18.04.

# Pros and Cons of each image
Jetpack 5 which uses Ubuntu 20.04 is not supposed to be compatible with Jetson Nano but the docker image does work pretty well but just keep in mind that some issues might arise from the incompatability. Using the Jetpack 5 version makes it easier to work with ROS 2 Foxy on the Jetson Nano. Because Jetpack 5 uses Ubuntu 20.04, ROS 2 packages can easily be installed from the package manager.

The JetPack 4.6.1 version which uses Ubuntu 18.04 is more cumbersome for using ROS 2 Foxy because we can't easily install ROS 2 packages from the package manager. With this docker image we have to build a lot of the software from source which can be complicated and time consuming. But the advantage with this image is that it is compatible with Jetson Nano and therefore less likely to be broken from weird incompatabilities.

# Building the Docker Image
There are docker files in the docker directory. These docker files build docker images for ARM Archiecture. This means that you would have to build these
images on a Jetson Nano or some other ARM based computer. If you have an Intel or AMD processor that means you are using an x86 or x64/amd64 based processor
and will get an error when trying to build the image on a machine with an Intel or AMD processor.

To build the docker image run:
./scripts/dockerbuild-arm64.sh name-your-container docker/Dockerfile.ros.foxy.mine

Replace name-your-container with any name you want to give the container
Replace docker/Dockerfile.ros.foxy.mine with the path to your dockerfile you want to use to build the image.

# Cross Building the Docker Images
Building docker images that build software from source can take a very long time if you build on a Jetson Nano. There is a way to build docker images meant for ARM architecture on your x86 machine. Intel and AMD processors tend to be more powerful on average and can speed up the build time a lot. Follow the instruction below to be able to cross build the Docker image in this repo.

1. Install Docker (Ideally version 20.10.18 or greater)
2. Run the following command: sudo apt install -y qemu-user-static binfmt-support (This installs QEMU support which can emulate different architectures such as ARM)
3. Run the command: docker buildx install (you might need to use sudo docker buildx install. This commands defaults to using buildx when building a docker image)
4. Run the script for building the docker from the previous Building the Docker Image section.

If your system has all the correct software such as qemu and buildx then the docker image should attempt to build. The best way to realize if you configured everything correctly is if you see an exec format error when trying to build the docker image. The exec format error usually means that docker errors out because you are trying to build an ARM docker image on an x86 machine. If you get the error it might mean you didn't install qemu from step 2 or your version of docker does not include the buildx package.


# High Level Docker Architecture
![image](https://user-images.githubusercontent.com/4980091/221400551-7024b5c9-71b8-4bbb-9c06-b85788337192.png)
There are currently two systems: cart and cart-slamv2.
cart shows that there are two containers running. The cart/slam container runs the realsense node and imu_filter_madwick for the D455 camera.
This was tested to work and does produce an acceptable SLAM map we can visualize in rviz2.
cart-slamv2 has a container that can run the realsense node but it uses librealsense v2.51.1 which breaks the D455 IMU on Jetson Nano. We need to
build a new image that uses librealsense v2.48.0 instead which has been verified to work on Jetson Nano.

# Images of Tests Ran with the cart System
![Screenshot from 2023-02-25 14-54-37](https://user-images.githubusercontent.com/4980091/221400768-a3ab6c6b-e431-4b2c-a4e4-f4b6d8257c45.png)
