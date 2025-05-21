---
## Front matter
title: "Отчет"
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

##  1. Запуск Linux в виртуальной машине

- Используется программа **VirtualBox 4.3**  
  [Скачать VirtualBox 4.3](https://www.virtualbox.org/wiki/Download_Old_Builds_4_3)

- Рекомендуемые образы Linux:
  - **bioLinux (на основе Ubuntu 12.04, 64-бит)** – _предназначен для биоинформатиков_
  - Альтернативы:
    - Ubuntu 12.04 (1.3 GB, 64-бит)
    - Ubuntu 12.04 (1.2 GB, 32-бит)

- Данные для входа:
  - Пользователь: `bi`
  - Пароль: `12345678`

-  Файлы, созданные в Linux, не видны в Windows и наоборот. Обмен файлами возможен через:
  - Email
  - Облачные хранилища
  - Настройку общих папок в VirtualBox (опционально)

---

##  2. Создание документа в LibreOffice/OpenOffice

**Цель:** Создать файл с единственной строкой:

```
Hello, Linux!
```

- **Шрифт:** `FreeMono`  
  (_если отсутствует, используйте `Arial` или `Times New Roman`_)

- **Сохранение:**
  - Вариант 1: `Microsoft Word 2003 XML (*.xml)`
  - Вариант 2: `OpenDocument Flat XML (*.fodt)`

---

##  3. Просмотр содержимого директории

**Условие:** Находясь в `/home/bi/Documents`, вывести содержимое `/home/bi/Downloads`.

**Правильные команды:**

```bash
ls ../Downloads
ls /home/bi/Downloads
ls ~/Downloads
```

---

##  4. Что произойдёт при запуске `firefox`, а затем `exit`

- Если выполнить:

  ```bash
  firefox
  ```

  — терминал **"замрёт" до завершения Firefox** (он запущен в **переднем фоне**).

- Команду `exit` **нельзя ввести**, пока Firefox не завершится.

- Если запускать так:

  ```bash
  firefox &
  ```

  — Firefox запустится в **фоне**, и `exit` закроет терминал, но Firefox останется работать.

---

##  5. stderr и пайпы (`|`)

```bash
command1 | command2
```

- По умолчанию **через pipe (`|`) передаётся только stdout**.
- **stderr НЕ передаётся**, а выводится напрямую в терминал.

---

##  6. Что скачивает команда `wget -r -l 1 -A jpg <URL>`

**Команда:**

```bash
wget -r -l 1 -A jpg <URL>
```

**Расшифровка:**

- `-r` — рекурсивная загрузка
- `-l 1` — уровень рекурсии 1 (только ссылки первого уровня)
- `-A jpg` — скачиваются **только файлы .jpg**

 **На практике:**
- Скачиваются:
  - HTML-страницы, необходимые для перехода по ссылкам (временно или как часть структуры)
  - Только `.jpg`-файлы сохраняются как результат

---

##  7. grep "world" text.txt — что найдёт?

```bash
grep "world" text.txt
```

- Ищет строки, содержащие **ровно `world`** (регистр имеет значение).
- Найдёт строки вроде:
  - `hello world`
  - `the world is round`
  - `myworld`
- Не найдёт:
  - `World`
  - `WORLD`
  - `World!` (если регистр важен)
::: {#refs}
:::
