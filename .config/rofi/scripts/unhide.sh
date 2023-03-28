#!/bin/bash

declare -A windows=()

for winid in $(bspc query -N -n .hidden.window)
do
  wintitle="$(xtitle $winid)"       # find wintitles of
  ! [[ -z $wintitle ]] &&\          # Remove titleless windows
  windows+=(["$winid"]=$wintitle)
done

selectedwin=$(printf '%s\n' "${windows[@]}" | rofi -dmenu -i -p "windows:")
for winid in ${!windows[@]}         # Locate wintitle of selectedwinid
do
  if [[ $selectedwin == ${windows[$winid]} ]]; then
    selectedid="$winid"
    break
  fi
done

bspc node $selectedid --flag hidden=off
bspc node --focus $selectedid
