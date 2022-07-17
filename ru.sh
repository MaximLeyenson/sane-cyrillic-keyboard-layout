#!/bin/bash

# ---------------------------------------------------------------------
# Step 1: running setxkbmap with default phonetic cyrillic
# ---------------------------------------------------------------------

echo "[ first, running default phonetic cyrillic setxkbmap ]"
echo "[ using Alt & Shift to toggle Russian Phonetic <-> En ]"
echo "[ and removing the Caps Lock ] " 
setxkbmap "us,ru" -variant ",phonetic" \
     -option "grp:alt_shift_toggle"  \
     -option "ctrl:nocaps"


# w.r.t. removing the CapsLock button:

	# xmodmap -e "remove lock = Caps_Lock"    

# is not working in Mint for some reason, (works in Fedora), but
#     -option "ctrl:nocaps"
# works in Mint.

# another variant of removing caps lock:
# reassigning CapsLock key -> space character:
# xmodmap -e "keycode  66 = space NoSymbol space NoSymbol space"
# this one is OK in Mint, too

# ---------------------------------------------------------------------
# Step 2: finding out the script location
# ---------------------------------------------------------------------

SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE 
  # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done

script_path=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

# "${BASH_SOURCE[0]} (or, more simply, $BASH_SOURCE ) contains the (potentially relative) path of the containing script"
# 
# cf. https://stackoverflow.com/questions/35006457/choosing-between-0-and-bash-source

# and 

# https://stackoverflow.com/questions/59895/how-can-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script

echo "script path: $script_path " 

# ---------------------------------------------------------------------
# Step 3: modifying the insane bindings with xmodmap
# ---------------------------------------------------------------------

configuration_file=${script_path}/layouts/xmodmap-cyrillic.conf

echo " [now modifying it with xmodmap for в,ж,ь] "
xmodmap $configuration_file && echo "[SUCCESS]"

# v -> Cyrillic в
# ; -> Cyrillic ж
# ' -> Cyrillic ь

echo "[ Being sane: ]"
echo 
echo "[  use v for Cyrillic в ]"
echo "[  use ' for Cyrillic ь ]"
echo "[  use ; for Cyrillic ж ]"
echo 
echo "[  Add (Shift) for capitals ]"

# ---------------------------------------------------------------------
# echo "reassigning Left Alt key -> space character"
# xmodmap -e "keycode  64 = space NoSymbol space NoSymbol space"
# 66 = CapsLock key -> space character
# 64 = left alt key

# cf.  /usr/share/X11/xkb/symbols/ru

