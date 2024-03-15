//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{" MEM: ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
	{"LANG: ", "xkb-switch",	2,		10},
  {"VOL: ", "amixer sget Master | awk -F\"[][]\" '/%/ { print $2 }' | head -n1", 2, 10},
  {"", "date '+%a %d %b %Y'", 20, 0},
  {"", "date '+%T '", 1, 0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
