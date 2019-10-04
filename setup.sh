#!/bin/bash

if [ -f ~/.tmux.conf ] ; then 
    read -p "[CAUTION] .tmux.conf already exists. Do you want to overwrite [Y/n]? " yn
    case $yn in
        "") 
            cat tmux.conf >> ~/.tmux.conf
            tmux source-file ~/.tmux.conf
            ;;
        [Yy]*)
            cat tmux.conf >> ~/.tmux.conf
            tmux source-file ~/.tmux.conf
            ;;
        [Nn]*)
            mv ~/.tmux.conf ~/tmp.tmux.conf
            echo "[INFO] Change .tmux.conf to tmp.tmux.conf"
            cp tmux.conf ~/.tmux.conf
            tmux source-file ~/.tmux.conf
            ;;
    esac
    echo "[INFO] Success to load tmux configuration."
fi
