#!/bin/bash
tmux new-session -d -s nvtopbar 'nvtop';
tmux split-window -h ;
tmux send 'cd src && bash literallynvburner.sh' ENTER;
tmux send 'cd src && bash literallynvburner.sh' ENTER;
tmux a;
