%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
div: DB 'Результат: ',0
rem: DB 'Остаток от деления: ',0
SECTION .text
GLOBAL _start
_start:
; ---- Вычисление выражения
mov eax,5 ; EAX=5
mov ebx,2 ; EBX=2
mul ebx ; EAX=EAX*EBX
add eax,3 ; EAX=EAX+3
xor edx,edx ; обнуляем EDX для корректной работы div
mov ebx,3 ; EBX=3
div ebx ; EAX=EAX/3, EDX=остаток от деления
mov edi,eax ; запись результата вычисления в 'edi'
; ---- Вывод результата на экран
mov eax,div call sprint mov eax,edi call iprintLF ; вызов подпрограммы печати
; сообщения 'Результат: '
; вызов подпрограммы печати значения
; из 'edi' в виде символов
mov eax,rem call sprint mov eax,edx call iprintLF ; вызов подпрограммы печати
; сообщения 'Остаток от деления: '
; вызов подпрограммы печати значения
; из 'edx' (остаток) в виде символов
call quit ; вызов подпрограммы завершения
