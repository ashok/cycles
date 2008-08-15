#!/bin/sh

if [ `uname` = "Darwin" ] ; then
   export BIN_HOME=../../bin/macos-debug ;
elif [ `uname` = "Linux" ] ; then
   export BIN_HOME=../../bin/linux-debug ;
elif [ `uname -o` = "Cygwin" ] ; then
   export BIN_HOME=../../bin/win32-debug ;
else
   echo "Unsupported platform: " `uname`
   exit -1 ;
fi

if [ "$1" = "" ] ; then
   export EXTRA_FILE=config/cycle_red.xml ;
fi

$BIN_HOME/dmzAppQt -f config/runtime.xml config/common.xml config/audio.xml config/input.xml config/net.xml config/render.xml config/simple.xml config/event.xml config/lua.xml $* $EXTRA_FILE
