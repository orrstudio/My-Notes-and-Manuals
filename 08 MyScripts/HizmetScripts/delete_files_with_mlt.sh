#!/bin/bash

# ======================================================== #
# Скрипт удаления файлов с расширением ".mlt" из папок     #
# в директории.                                            #
# -------------------------------------------------------- #
# Важно:                                                   #
# Сделайте скрипт исполняемым: (chmod +x script.sh)        #
# ======================================================== #


# Используем цикл для перебора всех папок в текущей директории
for folder in */; do
    # Переходим в папку
    cd "$folder"
    # Ищем файлы с расширением .mlt и удаляем их
    find . -type f -name "*.mlt" -exec rm {} \;
    # Возвращаемся обратно в исходную директорию
    cd ..
done