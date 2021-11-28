HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="NVBurner"
TITLE="NVBurner"
MENU="Controls"

OPTIONS=(1 "Change voltage"
         2 "Make changes persist"
         3 "Log graphics card status to ""logs"" folder"
)


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
            echo "Adjust the voltage (Watt):"
            read watt
            sudo nvidia-smi -pl $watt
            echo Adjusted!
            sleep 2
            bash literallynvburner.sh
            ;;
        2)
            sudo nvidia-smi -pm 1
            echo Done!
            sleep 2
            bash literallynvburner.sh
            ;;
        3)
            echo Starting...
            if [ -d "../logs/" ]; then
            cd ../logs/
            echo Started!

            nvidia-smi --query-gpu=index,timestamp,power.draw,clocks.sm,clocks.mem,clocks.gr --format=csv -l 1 > log.txt
            fi
            if [ ! -f "../logs/" ]; then
            cd .. && mkdir logs && cd logs
            echo Started!
            nvidia-smi --query-gpu=index,timestamp,power.draw,clocks.sm,clocks.mem,clocks.gr --format=csv -l 1 > log.txt
            fi


esac

dialog --clear --title "Message"  --yesno "Close app?" 6 25 2>&1 >/dev/tty
clear

response=$?
case $response in
   0) tmux send 'pkill nvtop && exit' ENTER ;;
   1) bash literallynvburner.sh ;;
esac
