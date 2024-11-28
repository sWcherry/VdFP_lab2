(defun reverse-and-nest-head (lst)
    (if (null (cdr lst))
        lst
        (list (reverse-and-nest-head (cdr lst)) (car lst))))

(defun check-reverse-and-nest-head (name lst expected)
    (format t "~:[FAILED~;passed~] ~a~%"
        (equal (reverse-and-nest-head lst) expected)
        name))

(defun test-reverse-and-nest-head ()
  (check-reverse-and-nest-head "test1" '(a b c) '(((c) b) a))
  (check-reverse-and-nest-head "test2" '(a) '(a))
  (check-reverse-and-nest-head "test3" '() nil))
