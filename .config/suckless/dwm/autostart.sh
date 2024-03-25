xrandr --output HDMI-0 --mode 1920x1080 &
setxkbmap -model pc105 -layout us,ru -option grp:alt_shift_toggle
feh --bg-fill $HOME/wallpapers/cactus.png &
xautolock -time 10 -locker slock &
dwmblocks &
export AWT_TOOLKIT=MToolKit
export _JAVA_AWT_WM_NONREPARENTING=1
wmname LG3D
ibus exit
