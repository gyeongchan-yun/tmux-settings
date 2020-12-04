#!/bin/bash

mode=$1
if [ -z $mode ]; then
  mode="2"
fi

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

if [ -f ~/.bashrc ]; then
  tmux_alias=`cat ~/.bashrc | grep 'alias tmux='`
  if [[ -z $tmux_alias ]]; then
    echo "[INFO] Configuration of alias for tmux in bashrc"
    echo alias tmux=\'tmux -2u\' >> ~/.bashrc
    source ~/.bashrc
  else
    echo "[INFO] Already alias for tmux is registered in bashrc."
  fi

  tmux_dev_alias=`cat ~/.bashrc | grep 'alias tmux_dev='`
  if [[ -z $tmux_dev_alias ]]; then
    echo "[INFO] Configuration of alias for tmux_dev in bashrc"
    echo alias tmux=\'source ~/tmux-conf/make_tmux_devmode.sh \'$mode >> ~/.bashrc
    source ~/.bashrc
  else
    echo "[INFO] Already alias for tmux_dev is registered in bashrc."
  fi
fi

echo "[INFO] Success to load my tmux configuration."
