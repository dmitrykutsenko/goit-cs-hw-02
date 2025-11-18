#!/bin/bash

# chmod +x myscript.sh
# Визначимо масив з URL вебсайтів для перевірки
sites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Назва файлу логів
logfile="website_status.log"

# Очищаємо файл логів перед записом нових даних
> "$logfile"

# Функція для перевірки статусу сайту
check_site() {
    if curl -s --head "$1" | grep "200" > /dev/null; then
        echo "<$1> is UP" >> "$logfile"
    else    
        echo "<$1> is DOWN" >> "$logfile"
    fi
}

# Перебір кожного сайту з масиву та виклик функції сheck_site
for site in "${sites[@]}"; do
    check_site "$site"
done

# Виводимо повідомлення про те, що результати записано уфайл логів
echo "Results have been logged to $logfile"