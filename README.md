# CSA_HW2
ИДЗ №2 по дисциплине "Архитектура вычислительный систем".
# Информация о программе и тестах.
Программа состоит из 2-х единиц компиляции (main и getResult).

Варианты запуска:
1. ./prog.out или ./prog.out 0 - считывание строк из консоли до нажатия ctrl+D.
2. ./prog.out 1 - считывание строк из файлов A.txt и B.txt, дальнейшая запись в output.txt.
3. ./prog.out 2 - случайная генерация строк.

Рeзультаты тестов для программы с рефакторингом (папка assembly_v.2) и без (папка assembly_v.1) можно посмотреть в папке tests.
# Рефакторинг кода.
1. Исправление строк кода, когда сначала данные кладут в rax, а потом в другой регистр. Вместо этогосразу кладётся в конечный регистр.
2. В main.s i было положено к r13d, вместо -4[rbp].
3. В getResult.s j было положено к r14d, вместо -4[rbp].
4. Удаление ненужных строк в конце файла.

Все изменение привели к уменьшения времени работы программы примерно в 1.8 раз (создание разности строк запускается 3*10^6 раз).
# Соответствие переменных программы адресам стека.
main.s:
1.  -68[pbp] = argc
2.  -80[rbp] = argv
3.  -4[rbp] = i
4.  -64[rbp] = x
5.  -24[rbp] = input
6.  -56[rbp] = output
7.  -32[rbp] = begin
8.  -40[rbp] = end
9.  -48[rbp] = prog_time
10. -16[rbp] = res

arcsin.s:
1.  -40[rbp] = x
2.  -12[rbp] = n 
3.  -24[rbp] = last
4.  -8[rbp] = res
# Передача параметров в функцию.
Передача параметров в функцию getResult производится через регистр edi, в который положено 128 (size_of_array)
Врзвращение результата функции mygetch производится через регистр eax.
# Опции компиляции
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./main.c -S -o ./main.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./getResult.c -S -o ./getResult.s
