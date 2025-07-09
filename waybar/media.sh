#!/bin/bash

# Получаем метаданные
metadata=$(playerctl -p chromium.instance2285 metadata 2>/dev/null)

if [[ -z "$metadata" ]]; then
    echo '{"text":"󰎈 No media","class":"inactive"}'
    exit 0
fi

# Парсим данные
artist=$(echo "$metadata" | grep 'xesam:artist' | awk -F'"' '{print $2}')
title=$(echo "$metadata" | grep 'xesam:title' | awk -F'"' '{print $2}')
album=$(echo "$metadata" | grep 'xesam:album' | awk -F'"' '{print $2}')
cover_url=$(echo "$metadata" | grep 'mpris:artUrl' | awk -F'"' '{print $2}')
status=$(playerctl -p chromium.instance2285 status 2>/dev/null)

# Готовим JSON
echo '{
  "text": "'"󰎈 ${artist:--} - ${title:--}"'",
  "tooltip": "'"<b>${title:--}</b>\n<i>${artist:--}</i>\n${album:--}"'",
  "class": "'"${status:-stopped}"'",
  "alt": "'"${status:-stopped}"'"
}'
