#!/bin/bash

PANELFG='#00000000'
PANELBG='#33FFFFFF'
PANELNAME='powermenupanel'
SIZE=$(xrandr -q |grep '*+'|awk '{print $1}')
WIDTH=$(echo $SIZE|cut -d'x' -f1)
#WIDTH=$(echo $(echo $SIZE|cut -d'x' -f1) / 2 |bc )
FONTSIZE=60
HEIGHT=$(echo $FONTSIZE + 20|bc)
XPADDING=0
YPADDING=$(echo $(echo $SIZE | cut -d'x' -f2) / 2 - $HEIGHT|bc)
FONTTYPE='FontAwesome'
GEOMETRY=$WIDTH'x'$HEIGHT'+'$XPADDING'+'$YPADDING
echo $GEOMETRY

LOCKCMD='i3lock'
LOCKICON=' LOCK'
LOCKFG='#CC4444AA'
LOCKBG='#33FFFFFF'

SLEEPCMD='systemctl suspend'
SLEEPICON=' SLEEP'
SLEEPFG='#CCFFEE22'
SLEEPBG='#33FFFFFF'

REBOOTCMD='systemctl reboot'
REBOOTICON=' REBOOT'
REBOOTFG='#CC80FF80'
REBOOTBG='#33FFFFFF'

POWEROFFCMD='systemctl poweroff'
POWEROFFICON=' POWER'
POWEROFFFG='#CCFF0000'
POWEROFFBG='#33FFFFFF'

#CANCELCMD='xdo kill $(xdo id -a '$PANELNAME')'
CANCELCMD='pkill -P '$$
CANCELICON=' KILL'
CANCELFG='#CC777777'
CANCELBG='#33FFFFFF'


echo '%{c}%{A:'$LOCKCMD' && '$CANCELCMD':}%{F'$LOCKFG' B'$LOCKBG'}'$LOCKICON'%{F- B-}%{A}'\
     '%{A:'$SLEEPCMD' && '$CANCELCMD':}%{F'$SLEEPFG' B'$SLEEPBG'}'$SLEEPICON'%{F- B-}%{A}'\
     '%{A:'$REBOOTCMD' && '$CANCELCMD':}%{F'$REBOOTFG' B'$REBOOTBG'}'$REBOOTICON'%{F- B-}%{A}'\
     '%{A:'$POWEROFFCMD' && '$CANCELCMD':}%{F'$POWEROFFFG' B'$POWEROFFBG'}'$POWEROFFICON'%{F- B-}%{A}'\
     '%{A:'$CANCELCMD':}%{F'$CANCELFG' B'$CANCELBG'}'$CANCELICON'%{F- B-}%{A}'\
      |lemonbar -p \
       -g $GEOMETRY \
       -n $PANELNAME \
       -F $PANELFG \
       -B $PANELBG \
       -f $FONTTYPE':size='$FONTSIZE | sh
