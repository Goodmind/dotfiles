#!/bin/bash
# $HOME/.config/i3/status.sh
# ------------------------------------------------------
# Dzen settings & Variables
# -------------------------
pkill -f "dzen2 -p -title-name status_bar"

SLEEP=1
ICONPATH="/home/gpix/.config/i3/icons/stlarch_icons"
COLOR_ICON="#BA2020"
CRIT_COLOR="#ff2c4a"
DZEN_FG="#A0A0A0"
DZEN_BG="#3c3c3c"
HEIGHT=24
WIDTH=1200
X=40
Y=0
BAR_FG="#ffffff"
BAR_BG="#555753"
BAR_H=7
BAR_W=40
FONT="-*-terminus-medium-r-*-*-12-*-*-*-*-*-iso10646-*"
VUP="amixer -c0 -q set Master 2dB+"
VDOWN="amixer -c0 -q set Master 2dB-"
EVENT="button1=;button2=;button3=;"
DZEN="dzen2 -p -e $EVENT -title-name status_bar -dock -h $HEIGHT -fn $FONT -ta right -bg $DZEN_BG -fg $DZEN_FG"

# -------------
# Infinite loop
# -------------
while :; do
sleep ${SLEEP}

# ---------
# Functions
# ---------
Vol ()
{
	VOL=$(amixer get Master | egrep -o "[0-9]+%" | head -1 | tr -d '%')
	echo -n "^fg($COLOR_ICON)^i($ICONPATH/vol1.xbm)^fg()^ca(1,pavucontrol)" $(echo $VOL | gdbar -fg $BAR_FG -bg $BAR_BG -h $BAR_H -w 2 -s v -sh 2 -nonl) "^ca()"
	return
}

Mem ()
{
	MEM=$(free -m | grep '-' | awk '{print $3}')
	echo -n "^fg($COLOR_ICON)^i($ICONPATH/mem1.xbm)^fg() ${MEM} MB"
	return
}

Temp ()
{
	TEMP=$(acpi -t | awk '{print $4}' | tr -d '.0')
		if [[ ${TEMP} -gt 63 ]] ; then
			echo -n "^fg($CRIT_COLOR)^i($ICONPATH/temp.xbm)^fg($CRIT_COLOR) ${TEMP}°C" $(echo ${TEMP} | gdbar -fg $CRIT_COLOR -bg $BAR_BG -h $BAR_H -s v -sw 5 -ss 0 -sh 1 -nonl)
		else
			echo -n "^fg($COLOR_ICON)^i($ICONPATH/temp.xbm)^fg() ${TEMP}°C" $(echo ${TEMP} | gdbar -fg $BAR_FG -bg $BAR_BG -h $BAR_H -s v -sw 5 -ss 0 -sh 1 -nonl)
		fi
	return
}

MPD ()
{
	MPDPLAYING=$(mpc | grep -c "playing")
	MPDPAUSED=$(mpc | grep -c "paused")
	MPDINFO=$(mpc | grep -v 'volume:' | head -n1)
	MPDTIME=$(mpc | awk '/\%/ {print $4}' | tr -d "()%")

	if [ $MPDPLAYING -eq 1 ] ; then
		echo -n "^fg($COLOR_ICON)^i($ICONPATH/note1.xbm)^fg() ^ca(1,mpc pause)[playing]^ca() ^ca(1,mpc next)$MPDINFO^ca() $(echo $MPDTIME | gdbar -fg $BAR_FG -bg $BAR_BG -h $BAR_H -w $BAR_W -s o -sw 2 -ss 1 -nonl)"
	else
		if [ $MPDPAUSED -eq 1 ] ; then
			echo -n "^fg($COLOR_ICON)^i($ICONPATH/note1.xbm)^fg() ^ca(1,mpc play)[paused]^ca() ^ca(1,mpc next)$MPDINFO^ca() $(echo $MPDTIME | gdbar -fg $BAR_FG -bg $BAR_BG -h $BAR_H -w $BAR_W -s o -sw 2 -ss 1 -nonl)"
		else
			echo -n "^fg($COLOR_ICON)^i($ICONPATH/note1.xbm)^fg() [stopped] $MPDINFO $(echo $MPDTIME | gdbar -fg $BAR_FG -bg $BAR_BG -h $BAR_H -w $BAR_W -s o -sw 2 -ss 1 -nonl)"
		fi
	fi

	return
}

Kernel ()
{
	KERNEL=$(uname -a | awk '{print $3}')
	echo -n "Kernel: $KERNEL"
	return
}

Date ()
{
	TIME=`date +'%Y-%m-%d %H:%M:%S'`
		echo -n "^fg($COLOR_ICON)^i($ICONPATH/clock1.xbm)^fg(#a0a0a0) ${TIME}"
	return
}

Between ()
{
    echo -n "  ^fg(#A0A0A0)^r(2x2)^fg() "
	return
}

OSLogo ()
{
	echo -n " ^fg($COLOR_ICON)^i($ICONPATH/arch1.xbm)^fg() "
	return
}
# --------- End Of Functions

# -----
# Print
# -----
Print () {
    Mem
    Between

    Date
    Between

    MPD
    Between

    Vol

    echo " "
    return
}

echo "$(Print)"
done | $DZEN &
