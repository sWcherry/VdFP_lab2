<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>

<p align="center">
<b>Звіт з лабораторної роботи 2</b><br/>
"Рекурсія"<br/>
з дисципліни "Вступ до функціонального програмування"
</p>

<p align="right"><b>Студентка</b>: Панченко Вікторія Володимирівна КВ-12</p>
<p align="right"><b>Рік</b>: 2024</p>

## Загальне завдання

Реалізуйте дві рекурсивні функції, що виконують деякі дії з вхідним(и) списком(-ами), за можливості/необхідності використовуючи різні види рекурсії. Функції, які необхідно реалізувати, задаються варіантом. Вимоги до функцій:

1. Зміна списку згідно із завданням має відбуватись за рахунок конструювання нового списку, а не зміни наявного (вхідного).
2. Не допускається використання функцій вищого порядку чи стандартних функцій для роботи зі списками, що не наведені в четвертому розділі навчального посібника.
3. Реалізована функція не має бути функцією вищого порядку, тобто приймати функції в якості аргументів.
4. Не допускається використання псевдофункцій (деструктивного підходу).
5. Не допускається використання циклів.

Кожна реалізована функція має бути протестована для різних тестових наборів. Тести мають бути оформленні у вигляді модульних тестів

## Варіант 1

1. Написати функцію `reverse-and-nest-head` , яка обертає вхідний список та утворює вкладeну структуру з підсписків з його елементами, починаючи з голови:
```
CL-USER> (reverse-and-nest-head '(a b c))
(((C) B) A)
```
2. Написати функцію `duplicate-elements` , що дублює елементи вхідного списку задану кількість разів:
```
CL-USER> (duplicate-elements '(a b c) 3)
(A A A B B B C C C)
```

## Лістинг функції reverse-and-nest-head

```lisp
(defun reverse-and-nest-head (lst)
    (if (null (cdr lst))
        lst
        (list (reverse-and-nest-head (cdr lst)) (car lst))))
```

### Тестові набори

```lisp
 (defun check-reverse-and-nest-head (name lst expected)
    (format t "~:[FAILED~;passed~] ~a~%"
        (equal (reverse-and-nest-head lst) expected)
        name))

(defun test-reverse-and-nest-head ()
  (check-reverse-and-nest-head "test1" '(a b c) '(((c) b) a))
  (check-reverse-and-nest-head "test2" '(a) '(a))
  (check-reverse-and-nest-head "test3" '() nil))
```

### Тестування

```lisp
CL-USER> (test-reverse-and-nest-head)
passed test1
passed test2
passed test3
NIL
```

## Лістинг функції duplicate-elements

```lisp
(defun dupl-element (el n)
    (unless (zerop n)
        (cons el (dupl-element el (1- n)))))

(defun duplicate-elements (lst n)
    (unless (null lst) 
        (append (dupl-element (car lst) n)
            (duplicate-elements (cdr lst) n))))
```

### Тестові набори

```lisp
(defun check-duplicate-elements (name lst n expected)
    (format t "~:[FAILED~;passed~] ~a~%"
        (equal (duplicate-elements lst n) expected)
        name))

(defun test-duplicate-elements ()
  (check-duplicate-elements "test1" '(a b c) 3 '(a a a b b b c c c))
  (check-duplicate-elements "test2" '(a b c) 1 '(a b c))
  (check-duplicate-elements "test3" '() 3 nil))
```

### Тестування

```lisp
CL-USER> (test-duplicate-elements)
passed test1
passed test2
passed test3
NIL
```