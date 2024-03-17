//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{" MEM: ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
	{"", "xkb-switch | awk '{print toupper($0)}'",	1,		0},
  {"VOL: ", "$HOME/.config/suckless/dwmblocks/scripts/volume.sh", 1, 0},
  {"BAT: ", "$HOME/.config/suckless/dwmblocks/scripts/power.sh", 1, 0},
  {"", "$HOME/.config/suckless/dwmblocks/scripts/network.sh", 1, 0},
  {"", "date '+%a %d %b %Y'", 15, 0},
  {"", "date '+%T' ", 1, 0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
