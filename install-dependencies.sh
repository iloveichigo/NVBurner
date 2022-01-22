#!/bin/bash
echo Installing dialog package if not exits...
sudo apt install dialog -y
sudo pacman -S dialog
sudo dnf install dialog
sudo zypper install dialog
clear

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="NVBurner"
TITLE="NVBurner"
MENU="Choose your linux distribution:"

OPTIONS=(1 "Ubuntu / Debian / Mint"
         2 "Fedora / Red Hat Enterprise Linux"
         3 "Arch Linux / Artix / Manjaro"
         4 "openSUSE")


CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "Starting..."
            sudo apt update
            sudo apt install tmux -y
            sudo apt install cmake make git -y
            git clone https://github.com/Syllo/nvtop.git
            mkdir -p nvtop/build && cd nvtop/build
            cmake ..
            make
            sudo make install
            ;;
        2)
            echo "Starting..."
            sudo dnf update
            sudo dnf install tmux
            sudo dnf install cmake make git
            git clone https://github.com/Syllo/nvtop.git
            mkdir -p nvtop/build && cd nvtop/build
            cmake ..
            make
            sudo make install

            ;;
        3)
            echo "Starting..."
            sudo pacman -Sy
            sudo pacman -S tmux cmake make git
            git clone https://github.com/Syllo/nvtop.git
            mkdir -p nvtop/build && cd nvtop/build
            cmake ..
            make
            sudo make install
                        ;;

        4)
            echo "Starting..."
            sudo zypper list-updates
            sudo zypper install cmake git tmux
            git clone https://github.com/Syllo/nvtop.git
            mkdir -p nvtop/build && cd nvtop/build
            cmake ..
            make
            sudo make install

                    ;;
esac
