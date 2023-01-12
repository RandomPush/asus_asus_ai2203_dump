#!/system/bin/sh
# $1 == 1 is ON, $1 == 0 is OFF

if [ "$1" == "0" ];then
	ret=`service call SurfaceFlinger 20000 i32 0`
	if [ "$ret" == "Result: Parcel(NULL)" ];then
		echo "PASS"
	else
		echo "FAIL"
	fi
elif [ "$1" == "1" ];then
	ret=`service call SurfaceFlinger 20000 i32 2`
	if [ "$ret" == "Result: Parcel(NULL)" ];then
		echo 255 > /sys/class/leds/lcd-backlight/brightness
		echo "PASS"
	else
		echo "FAIL"
	fi
else
	echo "Error Mode"
fi
