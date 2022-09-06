# automation untested, currently just documentation

FROM osrf/ros:ros-galactic-desktop@sha256:d73cba600c689ab71bb3e662ebb18f9a327667ba816d6e4d69bbf3efe9952368

RUN apt update

RUN apt install ros-galactic-navigation2:amd64=1.0.12-1focal.20220730.081413
RUN apt install ros-galactic-nav2-bringup:amd64=1.0.12-1focal.20220730.081550
RUN apt install ros-galactic-turtlebot3*
RUN apt install ros-galactic-xacro:amd64=2.0.7-1focal.20220430.044952
RUN apt install ros-galactic-robot-localization:amd64=3.2.4-1focal.20220730.030617

RUN source /opt/ros/galactic/setup.bash
ENV TURTLEBOT3_MODEL=waffle
ENV GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:/opt/ros/galactic/share/turtlebot3_gazebo/models

RUN apt install git
RUN git clone https://github.com/ros-planning/navigation2_tutorials/
RUN git reset --hard 7d672088d2b2dec31879aadf9c145bbe5f6824a9

WORKDIR /navigation2_tutorials/sam_bot_description

RUN colcon build
RUN . install/setup.bash

COPY run.sh .

CMD run.sh

