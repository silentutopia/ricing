#!/usr/bin/fish

set normal '%{F#ffffff}'
set urgent '%{F#e8586e}'
set good '%{F#00ff00}'
set inactive '%{F#616161}'
set separator $inactive' / '$normal

function battery
	set now (cat /sys/class/power_supply/BAT*/charge_now)
	set full (cat /sys/class/power_supply/BAT*/charge_full)
	set percent (math 100'*'$now'/'$full)

	if [ (cat /sys/class/power_supply/BAT*/status) = 'Charging' ]
		echo -n $good
	else if [ $percent -lt 10 ]
		echo -n $urgent
	end

	echo -n $percent'%'
end

function wifi
	set -l network (iwgetid -r)

	if [ $network ]
		echo -n $network
	end
end

function ipv4
	echo -n (ip addr | grep 'inet ' | grep -v '127.0.0.1' | awk '{ print $2}')
end

function time
	date '+%a %b %d, %H:%M'
end

while true
	echo -n '%{l}%{F-}'
	echo -n '%{c}%{F-}'(time)
	echo -n '%{r}%{F-}'(battery)$separator(wifi)' ('(ipv4)')'
	echo    ' '

	sleep .5
end

