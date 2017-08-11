#!/bin/bash
####################################################################
# Script to Install my programs on Lubuntu 16.04
# By Jesse @ UnB 
# email: jesseh.barreto@gmail.com 
#
# Please, do not change my header! But feel free to update me. ;)
# Version 1.0.1
#
# Last Diffs: 9/8/17
# * Add Qt installer 5.6.
# * Add Sublime 3.
# * Add Vivado 17.2 Additional packages
# * Add Oh-My-Zsh Files
# * Add Spotify to Listen to music while working
# * Add Vivado and SDK 17 Shortcuts
# * Add Quartus 17.0.2 Installation
####################################################################

###
# Creates our main library folder
cd ~
mkdir libs
cd ~/libs/

###
# Updating Headers and Essential Libs
echo -e "\e[33mGetting Essential Stuff ...\e[0m"
sudo apt-get update -y
sudo apt-get install build-essential -y
sudo apt-get install mesa-utils -y
sudo apt-get install gdebi -y
sudo apt-get install gnome-schedule -y
sudo apt-get install subversion autoconf exifprobe automake build-essential libass-dev libfreetype6-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev gdb pkg-config texinfo zlib1g-dev htop -y
echo -e "\e[32m[OK] Essential Stuff \e[0m"

###
# Install Oh-My-Zsh
echo -e "\e[33Getting Oh-My-Zsh ...\e[0m"
sudo apt-get install zsh -y
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo " " >> ~/.bashrc
echo "# Initialize Oh-My-Zsh" >> ~/.bashrc
echo "zsh" >> ~/.bashrc
echo " " >> ~/.bashrc
echo -e "\e[33Oh-My-Zsh ...\e[0m"

###
# Install NotePad
echo -e "\e[33Getting XPad ...\e[0m"
sudo apt-get install xpad -y
sudo cp /usr/share/applications/xpad.desktop ~/.config/autostart 
echo -e "\e[33XPad ...\e[0m"

###
# Keyboard Settings
echo -e "\e[33mGetting Keyboard Settings PT-BR and US ...\e[0m"
echo '@setxkbmap -option grp:ctrl_shift_toggle "us,pt"' | sudo tee -a /etc/xdg/lxsession/Lubuntu/autostart
# echo '@setxkbmap -layout "us,pt"'| sudo tee -a /etc/xdg/lxsession/Lubuntu/autostart
setxkbmap -layout us #Changes the Keyboard to English US comment this line tho.
echo -e "\e[32m[OK] Keyboard Settings PT-BR and US \e[0m"

###
# Install GIT
echo -e "\e[Getting GIT ...\e[0m"
sudo apt-get install git -y
echo -e "\e[32m[OK] GIT \e[0m"

###
# Install CMake
echo -e "\e[33mGetting CMake ...\e[0m"
sudo apt-get install cmake cmake-curses-gui -y
echo -e "\e[32m[OK] CMake \e[0m"

###
# Instalar o GIMP
echo -e "\e[33mGetting GIMP  ...\e[0m"
sudo apt-get -y install gimp
echo -e "\e[32m[OK] GIMP \e[0m"

###
# Install Zlib, ZenLib, SSL and MediaInfo
echo -e "\e[33mGetting Zlib, ZenLib, SSL and MediaInfo ...\e[0m"
sudo apt-get install zlib1g zlib1g-dev -y
sudo apt-get install openssl libcurl4-openssl-dev libssh-dev -y
sudo apt-get install libzen0v5 libzen-dev -y
sudo apt-get install libmediainfo0v5 libmediainfo-dev -y
echo -e "\e[32m[OK] Zlib, ZenLib, SSL and MediaInfo \e[0m"

###
# Install Exiv2
echo -e "\e[33mGetting Exiv2 ...\e[0m"
cd ~/libs/
wget http://www.exiv2.org/exiv2-0.25.tar.gz
tar -xzvf exiv2-0.25.tar.gz
cd exiv2-0.25
cd build
cmake -G "Unix Makefiles" -DENABLE_SHARED:bool=on ..
make -j4
sudo make install
make distclean
echo -e "\e[32m[OK] Exiv2 \e[0m"

###
# Install YASM
echo -e "\e[33mGetting YASM  ...\e[0m"
sudo apt-get -y install yasm
echo -e "\e[32m[OK] GIMP \e[0m"

###
# Install libx264
echo -e "\e[33mGetting libx264  ...\e[0m"
sudo apt-get install libx264-dev -y
echo -e "\e[32m[OK] libx264 \e[0m"

###
# Install libx265
echo -e "\e[33mGetting libx265  ...\e[0m"
sudo apt-get install libx265-dev -y
echo -e "\e[32m[OK] libx265 \e[0m"

###
# Install libfdk-aac
echo -e "\e[33mGetting libfdk-aac  ...\e[0m"
sudo apt-get install libfdk-aac-dev -y
echo -e "\e[32m[OK] libfdk-aac \e[0m"

###
# Install libmp3lame
echo -e "\e[33mGetting libmp3lame  ...\e[0m"
sudo apt-get install libmp3lame-dev -y
echo -e "\e[32m[OK] libmp3lame \e[0m"

###
# Install libopus
echo -e "\e[33mGetting libmp3lame  ...\e[0m"
sudo apt-get install libopus-dev -y
echo -e "\e[32m[OK] libopus \e[0m"

###
# Install libvpx
echo -e "\e[33mGetting libvpx  ...\e[0m"
sudo apt-get install libvpx-dev -y
echo -e "\e[32m[OK] libvpx \e[0m"

###
# Install FFMpeg 3.0.2
echo -e "\e[33mGetting FFMpeg 3.0.2  ...\e[0m"
cd ~/libs/
wget http://storage.googleapis.com/downloads.webmproject.org/releases/webm/libvpx-1.5.0.tar.bz2
tar xzvf tar xjvf ffmpeg-3.0.4.tar.bz2
cd ffmpeg-3.0.4
./configure --enable-shared --enable-gpl --enable-libass --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libtheora --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 --enable-nonfree
make -j4
sudo make install
make distclean
echo -e "\e[32m[OK] FFMpeg 3.0.2 \e[0m"

###
# Install OpenCV 2.4.13
echo -e "\e[33mGetting OpenCV 2.4.13  ...\e[0m"
cd ~/libs/
sudo apt-get -y install libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get -y install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev libopenexr-dev 
wget https://github.com/Itseez/opencv/archive/2.4.13.zip
unzip 2.4.13.zip
cd opencv-2.4.13
mkdir build && cd ./build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=ON -DWITH_FFMPEG=ON ..
make -j4
sudo make install
make distclean
echo -e "\e[32m[OK] OpenCV 2.4.13 \e[0m"

###
# Install Core SystemC from Accellera
echo -e "\e[33mGetting SystemC 2.3.1   ...\e[0m"
cd ~/libs/
wget http://accellera.org/images/downloads/standards/systemc/systemc-2.3.1a.tar.gz
tar xzvf systemc-2.3.1a.tar.gz
cd systemc-2.3.1a
mkdir build && cd build
export CXX=g++
../configure
make -j4
sudo make install
make distclean
echo -e "\e[32m[OK] SystemC 2.3.1  \e[0m"

###
# Getting Sublime 3
echo -e "\e[33mGetting Sublime 3   ...\e[0m"
cd ~/libs/
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer -y
echo -e "\e[32m[OK] Sublime 3  \e[0m"

###
# Install Spotify
echo -e "\e[33mGetting Spotify   ...\e[0m"
# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# 3. Update list of available packages
sudo apt-get update
# 4. Install Spotify
sudo apt-get install spotify-client -y
echo -e "\e[32m[OK] Spotify  \e[0m"

###
# Download Qt Creator
echo -e "\e[33mDownloading Qt 5.6.2 installer 	...\e[0m"
cd ~/libs/
wget http://download.qt.io/official_releases/qt/5.6/5.6.2/qt-opensource-linux-x64-5.6.2.run
echo -e "\e[32m[OK] Download Qt 5.6.2 ....  \e[0m"

###
# Additional Libraries Vivado 2017.2 at Ubuntu-like distro Lubuntu 16
echo -e "\e[33mGetting Additional Packages for Vivado 16	...\e[0m"
sudo apt-get install git python-virtualenv g++-arm-linux-gnueabihf -y
sudo apt-get install gcc-arm-linux-gnueabi lib32stdc++6 lib32z1 u-boot-tools libssl-dev -y
sudo apt-get install bc device-tree-compiler qemu-user-static curl zip -y
# sudo ln -s make /usr/bin/gmake # It's not necessary
sudo apt-get install python-pip -y
sudo pip install --upgrade pip
sudo pip install -r requirements.txt
# Create an executable for Vivado 2017.2
sudo touch /usr/local/bin/run-vivado2017_2
echo '#!/bin/bash' | sudo tee --append /usr/local/bin/run-vivado2017_2
echo ". /opt/Xilinx/Vivado/2017.2/bin/settings64.sh" | sudo tee --append /usr/local/bin/run-vivado2017_2
echo "vivado &" | sudo tee --append /usr/local/bin/run-vivado2017_2
sudo chmod +x /usr/local/bin/run-vivado2017_2
# Create an executable for SDK 2017.2
sudo touch /usr/local/bin/run-sdk2017_2
echo '#!/bin/bash' | sudo tee --append /usr/local/bin/run-sdk2017_2
echo ". /opt/Xilinx/SDK/2017.2/settings64.sh" | sudo tee --append /usr/local/bin/run-sdk2017_2
echo "xsdk &" | sudo tee --append /usr/local/bin/run-sdk2017_2
sudo chmod +x /usr/local/bin/run-sdk2017_2
# Create Vivado shortcut
sudo touch /usr/share/applications/vivado2017.desktop
echo '[Desktop Entry]' | sudo tee --append /usr/share/applications/vivado2017.desktop
echo 'Name=Vivado 2017.2' | sudo tee --append /usr/share/applications/vivado2017.desktop
echo 'GenericName=Xilinx Development Program' | sudo tee --append /usr/share/applications/vivado2017.desktop
echo 'Comment=Open Xilinx Vivado 2017' | sudo tee --append /usr/share/applications/vivado2017.desktop
echo 'Exec=/usr/local/bin/run-vivado' | sudo tee --append /usr/share/applications/vivado2017.desktop
echo 'Terminal=false' | sudo tee --append /usr/share/applications/vivado2017.desktop
echo 'Type=Application' | sudo tee --append /usr/share/applications/vivado2017.desktop
echo 'Path=/home/jesseh/workspace/.vivadologs/' | sudo tee --append /usr/share/applications/vivado2017.desktop
echo 'Icon=/opt/Xilinx/Vivado/2017.2/doc/images/vivado_logo.ico' | sudo tee --append /usr/share/applications/vivado2017.desktop
echo 'Categories=Development;Utility;Xilinx;' | sudo tee --append /usr/share/applications/vivado2017.desktop
echo 'StartupNotify=true' | sudo tee --append /usr/share/applications/vivado2017.desktop
# Create SDK Shortcut
sudo touch /usr/share/applications/sdk2017.desktop
echo '[Desktop Entry]' | sudo tee --append /usr/share/applications/sdk2017.desktop
echo 'Name=Xilinx SDK 2017.2' | sudo tee --append /usr/share/applications/sdk2017.desktop
echo 'GenericName=Xilinx IDE' | sudo tee --append /usr/share/applications/sdk2017.desktop
echo 'Comment=Open Xilinx SDK 2017' | sudo tee --append /usr/share/applications/sdk2017.desktop
echo 'Exec=/usr/local/bin/run-xilinxsdk2017' | sudo tee --append /usr/share/applications/sdk2017.desktop
echo 'Terminal=false' | sudo tee --append /usr/share/applications/sdk2017.desktop
echo 'Type=Application' | sudo tee --append /usr/share/applications/sdk2017.desktop
echo 'Path=/home/jesseh/workspace/.vivadologs/' | sudo tee --append /usr/share/applications/sdk2017.desktop
echo 'Icon=/opt/Xilinx/SDK/2017.2/data/sdk/images/sdk_logo.ico' | sudo tee --append /usr/share/applications/sdk2017.desktop
echo 'Categories=Development;Utility;Xilinx;' | sudo tee --append /usr/share/applications/sdk2017.desktop
echo 'StartupNotify=true' | sudo tee --append /usr/share/applications/sdk2017.desktop
echo "# Source Vivado 2017" >> ~/.bashrc
echo "source /opt/Xilinx/SDK/2017.2/settings64.sh" >> ~/.bashrc
echo " " >> ~/.bashrc
echo -e "\e[32m[OK] Additional Vivado 16 Packages....  \e[0m"

###
# Install Quartus 17.0.2
echo -e "\e[33mGetting Quartus 17.0.2	...\e[0m"
cd ~/libs/
sudo apt-get install expat fontconfig xorg-dev glibc-source libcanberra-dev libpng12-dev libpng12-dev libice-dev libsm-dev util-linux ncurses-base tcl-dev tcllib zlib1g-dev libx11-dev libxau-dev libxdmcp-dev libxext-dev libxft-dev libxrender-dev libxt-dev libxtst-dev -y
wget http://download.altera.com/akdlm/software/acdsinst/17.0std.2/602/ib_tar/Quartus-lite-17.0.2.602-linux.tar
mkdir Quartus-lite-17
tar -xf Quartus-lite-17.0.2.602-linux.tar -C Quartus-lite-17
cd Quartus-lite-17
sudo ./setup.sh
cd ..
sudo rm -Rf Quartus-lite-17 # Clean the garbage
echo "# Quartus 17.0.2" >> ~/.bashrc
echo "export PATH=$PATH:/opt/intelFPGA_lite/17.0/quartus/bin" >> ~/.bashrc
echo 'export QSYS_ROOTDIR="/opt/intelFPGA_lite/17.0/quartus/sopc_builder/bin"' >> ~/.bashrc
echo " " >> ~/.bashrc
# USB-Blaster Cable Driver
sudo touch /etc/udev/rules.d/51-altera-usb-blaster.rules
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"' | sudo tee --append /etc/udev/rules.d/51-altera-usb-blaster.rules
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"' | sudo tee --append /etc/udev/rules.d/51-altera-usb-blaster.rules
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"' | sudo tee --append /etc/udev/rules.d/51-altera-usb-blaster.rules
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"' | sudo tee --append /etc/udev/rules.d/51-altera-usb-blaster.rules
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"' | sudo tee --append /etc/udev/rules.d/51-altera-usb-blaster.rules
sudo udevadm control --reload
sudo mkdir /etc/jtagd
sudo cp /opt/intelFPGA_lite/17.0/quartus/linux64/pgm_parts.txt /etc/jtagd/jtagd.pgm_parts
echo -e "\e[32m[OK] Quartus 17.0.2	....  \e[0m"

###
# Install SoC Embedded Design Suite
echo -e "\e[33mGetting SoC Embedded Design Suite	...\e[0m"
cd ~/libs/
sudo apt-get install xterm libfontconfig1-dev libfreetype6-dev libice-dev libusb-dev libsm-dev libx11-dev libxcursor-dev libxext-dev libxft-dev libxmu-dev libxrandr-dev libxrender-dev -y
sudo apt-get install libwebkit-dev libwebkitgtk-dev -y
sudo apt-get install libfontconfig1:i386 libfreetype6:i386 libgl1-mesa-glx:i386 libgl1-mesa-dri:i386 libice6:i386 libsm6:i386 libusb-0.1-4:i386 libx11-6:i386 libxcursor1:i386 libxext6:i386 libxft2:i386 libxmu6:i386 libxrandr2:i386 libxrender1:i386 -y
wget http://download.altera.com/akdlm/software/acdsinst/17.0std/595/ib_installers/SoCEDSSetup-17.0.0.595-linux.run
chmod +x SoCEDSSetup-17.0.0.595-linux.run
sudo ./SoCEDSSetup-17.0.0.595-linux.run
# If DS-5 do not install run it apart
echo -e "\e[32m[OK] SoC Embedded Design Suite	....  \e[0m"