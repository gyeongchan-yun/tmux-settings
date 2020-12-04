#!/bin/bash

mode=$1
if [ -z $mode ]; then
  mode="2"
fi

if [ "$mode" == "2" ]; then
  tmux split-window -v -p 20
  tmux split-window -h -p 50
fi
if [ "$mode" == "3" ]; then
  tmux split-window -v -p 20
  tmux split-window -h -p 33
  tmux split-window -h -p 50
fi
