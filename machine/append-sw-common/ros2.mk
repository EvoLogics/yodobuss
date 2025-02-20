
LAYERS += https://github.com/ros/meta-ros.git;subdirs=meta-ros2,meta-ros2-galactic,meta-ros-common
LAYERS += git@gitlab.evologics.de:bsp/meta-evo-private.git

# define the ROS 2 Yocto target release
ROS_OE_RELEASE_SERIES = "dunfell"

# define ROS 2 distro
LOCAL_CONF_OPT   += 'ROS_DISTRO = "galactic"'

LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = "  vision-msgs cv-bridge geodesy tf-transformations robot-localization "'
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = "  xacro pcl-conversions "'

# ros2-nav2
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " nav2-amcl nav2-behavior-tree nav2-bt-navigator "'
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " nav2-controller nav2-core nav2-costmap-2d nav2-dwb-controller "'
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " nav2-lifecycle-manager nav2-map-server nav2-msgs nav2-navfn-planner "'
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " nav2-planner nav2-recoveries nav2-regulated-pure-pursuit-controller "'
LOCAL_CONF_OPT   += 'IMAGE_INSTALL_append = " nav2-smac-planner nav2-util nav2-voxel-grid nav2-waypoint-follower "'
