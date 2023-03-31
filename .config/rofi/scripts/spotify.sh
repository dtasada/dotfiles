declare -A playlists=( 
  ["Jazz"]="https://open.spotify.com/playlist/54ZkLY188KAZcvprwydhWS?si=41379207e5e940f4"
  ["soft pop"]="https://open.spotify.com/playlist/0GKz8VUJkWaC1qCTB2lglW?si=e0461b5f020e4325"
  ["LOFI"]="https://open.spotify.com/playlist/0aUfKmOsEkap2JpGXIFsN9?si=8933833ad0a84b37"
  ["Pop-Rock"]="https://open.spotify.com/playlist/38wBuQF7WfL5TtlCQarvny?si=8a6a24b26dc946e1"
  ["My 2020's"]="https://open.spotify.com/playlist/0tkwUjbK8RrNMvdRX26N2w?si=7dce2faa201942a6"
)

selection=$(printf '%s\n' "${!playlists[@]}" | rofi -dmenu)
killall spotify
spotify --uri=${playlists["$selection"]}
