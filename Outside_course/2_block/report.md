---
## Front matter
title: "Отчет по 2 блоку"
subtitle: "Простейший вариант"
author: "Баженов Тимур"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# 🖥 Доклад: Работа с удалёнными серверами, SSH и Linux-инструментами

---

## 🔐 SSH и ключи

### Что создаёт `ssh-keygen`

Команда `ssh-keygen` создаёт два файла:

- `id_rsa` — **приватный ключ**
  - Никогда не передаётся по сети
  - Хранится в секрете
- `id_rsa.pub` — **публичный ключ**
  - Можно передавать, размещать на сервере
  - Безопасен для распространения

### Почему передача публичного ключа безопасна?

- Публичный ключ используется для **шифрования**
- Только соответствующий приватный ключ может **расшифровать** данные
- Без приватного ключа доступ к системе невозможен

### Как подключаться по SSH

1. Скопировать публичный ключ на сервер:
   ```bash
   ssh-copy-id user@remote_host
Или вручную добавить содержимое id_rsa.pub в ~/.ssh/authorized_keys на сервере
Подключение:
ssh user@remote_host
🔁 Обмен файлами через терминал

SCP — Secure Copy Protocol
Используется для копирования файлов между локальной и удалённой машинами по SSH.

Отправка файла на сервер:

scp local_file.txt user@remote_host:/remote/path/
Скачивание файла с сервера:

scp user@remote_host:/remote/file.txt /local/path/
📦 Установка программ на сервере

Через терминал:
На Debian/Ubuntu:

sudo apt-get update
sudo apt-get install имя_программы
Пример:

sudo apt-get install tmux
⚙️ Управление процессами

Основные команды:
Просмотр всех процессов:
ps aux
Просмотр своих процессов:
ps ux
Завершение процесса:
kill PID
Запуск в фоне:
./script.sh &
🧵 Потоки и процессы

Процесс — экземпляр работающей программы
Поток — часть процесса, может выполняться параллельно с другими потоками
Пример: bowtie2
bowtie2 -x genome -U reads.fq -S output.sam -p 8
Флаг -p указывает число потоков.

🪟 Использование tmux

tmux — терминальный мультиплексор, позволяющий:

Работать с несколькими терминалами в одном окне
Оставлять процессы запущенными после разрыва соединения
Основные команды:
Запуск новой сессии:
tmux
Отключение (оставляет сессию в фоне):
Ctrl + B, затем D
Повторное подключение:
tmux attach
💻 Установка Linux

Вариант 1: Полноценная установка (на компьютер)
Скачать ISO-образ (например, Ubuntu с сайта https://ubuntu.com)
Создать загрузочную флешку:
Windows: Rufus
Linux/macOS: dd или balenaEtcher
Загрузиться с флешки и следовать инструкциям установщика
Вариант 2: Установка в VirtualBox
Скачать VirtualBox
Создать новую виртуальную машину:
Память: от 2048 МБ
Жёсткий диск: от 20 ГБ
Запустить установку Linux с ISO-образа
✅ Заключение

SSH и ключи — основа безопасного доступа
SCP — простой способ передачи файлов
tmux и управление процессами — ключ к стабильной удалённой работе
Установка Linux возможна как на физическое устройство, так и в виртуальной машине
Эти навыки составляют базу для продуктивной и безопасной работы на удалённых серверах.


Вы можете использовать этот Markdown-файл в редакторах (например, Typora, Obsidian, Visual Studio Code) или разместить его на GitHub/Docs-сайтах.
::: {#refs}
:::
