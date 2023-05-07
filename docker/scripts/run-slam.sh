#!/bin/bash

# Add commands or call other bash scripts that will start nodes we need to run SLAM with rtabmap
# Use the GNU Parallel utility to run launch file for realsense and rtabmap in parallel
parallel -u ::: '/launch-legacy-realsense-ros.sh' '/launch-new-rtabmap.sh'