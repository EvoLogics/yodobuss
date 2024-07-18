LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git
LAYERS += https://github.com/ros/meta-ros.git;subdirs=meta-ros-common,meta-ros-backports-gatesgarth,meta-ros-backports-hardknott,meta-ros1,meta-ros1-noetic
# Option for ROS
LOCAL_CONF_OPT   += 'ROS_OE_RELEASE_SERIES = "dunfell"'
# Install ros core and needed packages
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " packagegroup-ros1-comm ros-core ros-base rospy catkin catkin-dev sensor-msgs geographic-info geographic-msgs vision-msgs cv-bridge"'
# Install opencv
LOCAL_CONF_OPT += 'IMAGE_INSTALL_append = " packagegroup-opencv python3-opencv python3-tensorrt python3-pycuda"'
