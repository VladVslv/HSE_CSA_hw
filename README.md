# CSA_HW3
ИДЗ №3 по дисциплине "Архитектура вычислительный систем".

В данной прогамме вычисление степенного ряда проводились до тех пор, пока текущий результат изменялся хотя бы на 0.05%. В задании не было ясно прописано, относительно чего должны браться 0.05 процент (следующий член степенного ряда относительно текущей суммы или значение моей функции относительно эталонного), так что я выбрал первый подход.
# Информация о программе и тестах.
Программа состоит из 2-х единиц компиляции (main и arcsin).

Варианты запуска:
1. ./prog.out - считывание числа из консоли.
2. ./prog.out input_name output_name- считывание числа из файла c именем input_name, дальнейшая запись в файл с именем output_name.
3. ./prog.out output_name - случайная генерация строк, дальнейшая запись в файл с именем output_name.

Рeзультаты тестов для программы без рефакторинга (assembly_v1), с рефакторингом (assembly_v2), с использованием опций оптимизации по размеру (assembly_memory_optimization) и скорости (assembly_memory_optimization) можно посмотреть в папке tests.
# Рефакторинг кода.
1. Исправление строк кода, когда сначала данные кладут в rax, а потом в другой регистр. Вместо этого сразу кладётся в конечный регистр.
2. В main.s i было положено в r13d, вместо -4[rbp].
3. В arcsin.s x был положен в xmm4, вместо -40[rbp].
4. В arcsin.s n былo положенo в r14d, вместо -12[rbp].
5. В arcsin.s last былo положенo в xmm5, вместо -24[rbp].
6. В arcsin.s res был положен в xmm6, вместо 8[rbp].
7. Удаление ненужных строк в конце файла.

Все изменение привели к незначительному изменению времени работы программы (поиск арксинуса запускается 4*10^6 раз).
# Соответствие переменных программы адресам стека.
main.s:
1.  -68[pbp] = argc
2.  -80[rbp] = argv
3.  -4[rbp] = i (в конечной программе лежит в r13d)
4.  -64[rbp] = x
5.  -24[rbp] = input
6.  -56[rbp] = output
7.  -32[rbp] = begin
8.  -40[rbp] = end
9.  -48[rbp] = prog_time
10. -16[rbp] = res

arcsin.s:
1.  -40[rbp] = x (в конечной программе лежит в xmm4)
2.  -12[rbp] = n (в конечной программе лежит в r14d)
3.  -24[rbp] = last (в конечной программе лежит в xmm5)
4.  -8[rbp] = res (в конечной программе лежит в xmm6)
# Передача параметров в функцию.
Передача параметров в функцию arcsin производится через регистр xmm0.

Возвращение результата функции arcsin производится через регистр xmm0.
# Опции компиляции
Стандартная компиляция:

gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./main.c -S -o ./main.s

Компиляция с использованием опций оптимизации размера (привела к уменьшению размера файлов примерно в 1.5 раза):

gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -ffunction-sections -Wl,--gc-sections -Os -ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables -ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables -Wl,--strip-all ./main.c -S -o ./main.s

Компиляция с использованием опций оптимизации скорости (привела к увеличению скорости программы примерно в 2.5 раз):

gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -m64 -Ofast -flto -march=native -funroll-loops ./main.c -S -o ./main.s
