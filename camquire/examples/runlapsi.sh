#!/bin/sh
cmd=runlapsi.py
if ps -ef | grep -v grep | grep -v $(basename $0) | grep $cmd
then exit 0
else
  /home/pi/bin/$cmd
fi
