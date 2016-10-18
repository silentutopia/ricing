#!/bin/sh
BACKGROUND=#555555
TEXT=#FFFFFF
clock() {
	date +%H:%M
}

battery() {
	cat /sys/class/power_supply/BAT0/capacity
}
batteryStatus(){
	cat /sys/class/power_supply/BAT0/status
}
backlight() {
	xbacklight
}
ssid() {
	iwgetid -r
}

while [ true ]
do
#   BAR_INPUT="%{B$BACKGROUND} %{F$TEXT} $(ssid) %{c}TIME : $(clock) %{r} Battery : $(battery)% $(batteryStatus) "
BAR_INPUT="$(ssid) %{c}TIME : $(clock) %{r} Battery : $(battery)% $(batteryStatus) "
   echo $BAR_INPUT
#battery



	
    sleep 1
done

