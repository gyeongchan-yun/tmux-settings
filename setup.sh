#!/bin/bash

if [ -f ~/.tmux.conf ] ; then 
    read -p "[CAUTION] .tmux.conf already exists. Do you want to overwrite [Y/n]? " yn
    case $yn in
        "") 
            cp tmux.conf ~/.tmux.conf
            tmux source-file ~/.tmux.conf
            ;;
        [Yy]*)
            cp tmux.conf ~/.tmux.conf
            tmux source-file ~/.tmux.conf
            ;;
        [Nn]*)
            mv ~/.tmux.conf ~/tmp.tmux.conf
            echo "[INFO] Change existing file to tmp.tmux.conf"
            cp tmux.conf ~/.tmux.conf
            tmux source-file ~/.tmux.conf
            ;;
    esac
else
    cp tmux.conf ~/.tmux.conf
    tmux source-file ~/.tmux.conf
fi

echo "[INFO] Success to load my tmux configuration."
