#!/bin/bash
####################################################################
# Script to Install ROS Lunar on Lubuntu 16.04
# By Jesse @ UnB 
# email: jesseh.barreto@gmail.com 
####################################################################

# Dependencies
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential -y

# Setup Sources
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup Keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Installation
sudo apt-get update
sudo apt-get install ros-lunar-desktop -y

# Start rosdep
sudo rosdep init
rosdep update

# Environment Variables
echo "source /opt/ros/lunar/setup.zsh" >> ~/.zshrc
source ~/.zshrc
echo " " >> ~/.bashrc
echo "# ROS Variables" >> ~/.bashrc
echo "source ~/.zshrc" >> ~/.bashrc
