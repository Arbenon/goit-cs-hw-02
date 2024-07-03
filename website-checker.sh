#!/bin/bash

# Масив з URL-адресами для перевірки
sites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Назва файлу логів
logfile="site_status.log"

# Очищення файлу логів перед записом
> "$logfile"

# Цикл для перевірки кожного сайту
for site in "${sites[@]}"; do
  # Виконання curl запиту з дотриманням перенаправлень і збереження статусу HTTP відповіді
  status=$(curl -L -o /dev/null -s -w "%{http_code}" "$site")

  # Форматування результату перевірки
  if [ "$status" -ge 200 ] && [ "$status" -lt 400 ]; then
    result="[$site]($site) is UP"
  else
    result="[$site]($site) is DOWN"
  fi

  # Вивід результату в термінал
  echo "$result"

  # Запис результату у файл логів
  echo "$result" >> "$logfile"
done
