%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
msg: DB 'Введите номер студенческого билета: ',0
rem: DB 'Ваш вариант задания: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
; ---- Вычисление выражения
mov eax,msg
call sprintLF
mov ecx,x
mov edx,80
call sread

mov eax,x
call atoi; преобразуем asci в целое число
xor edx,edx; обнуляем остаток
mov ebx,20
div ebx; eax = eax / ebx
inc edx ;к остатку edx прибавляем 1

mov eax,rem
call sprint
mov eax,edx
call iprintLF
call quit