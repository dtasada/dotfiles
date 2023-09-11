langlist=("English" "Dutch" "Spanish")
targetlang="$(echo ${langlist[@]} | tr " " "\n" | rofi -dmenu -p 'translate to: ')" || exit
str="$(rofi -dmenu -p 'translate str: ')"
# brave https://translate.google.com/?sl=auto\&tl=$lang\&text=$(url_encode $word)\&op=translate
translation="$(trans -b "$str" -target "$targetlang")"
notify-send "Translate" "$translation"
wl-copy $translation
