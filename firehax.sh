#!/bin/bash

W=`xdotool getactivewindow`                                                     
S1=`xprop -id ${W} |awk -F '"' '/WM_CLASS/{print $4}'`                                 
if [ "$S1" == "Firefox-esr" ] || [ "$S1" == "Firefox Developer Edition" ]; then
	xvkbd -xsendevent -text "\C\b"
else
	xvkbd -xsendevent -text "\Cw"
#	echo $S1
fi
