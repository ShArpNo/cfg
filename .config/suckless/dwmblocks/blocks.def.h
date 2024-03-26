//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{" ^c#e9b143^󰍛 ^d^", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
	{"", "xkb-switch | awk '{print toupper($0)}'",	1,		0},
  {"^c#f2594b^󰕾 ^d^", "$HOME/.config/suckless/dwmblocks/scripts/volume.sh", 1, 0},
  {"^c#b0b846^󰈀 ^d^", "$HOME/.config/suckless/dwmblocks/scripts/network.sh", 1, 0},
  {"^c#80aa9e^ ^d^", "date '+%a %d %b %Y'", 15, 0},
  {"^c#f28534^󰥔 ^d^", "date '+%T '", 1, 0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
