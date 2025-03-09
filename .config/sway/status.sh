date_formatted=$(date "+%a %F %H:%M")
battery_info=$(echo "$(cat /sys/class/power_supply/BAT1/status) $(upower -d | grep -Po "percentage: .* (\d+%)" | head -n 1 | awk '{print $2}')")
audio_volume=$(echo "🔈$(pamixer --get-volume)%")

# Additional emojis and characters for the status bar:
# Electricity: ⚡ ↯ ⭍ 🔌
# Audio: 🔈 🔊 🎧 🎶 🎵 🎤
# Separators: \| ❘ ❙ ❚
# Misc: 🐧 💎 💻 💡 ⭐ 📁 ↑ ↓ ✉ ✅ ❎
echo $audio_volume $battery_info 🔋 $date_formatted
