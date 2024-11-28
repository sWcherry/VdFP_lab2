(defun dupl-element (el n)
    (unless (zerop n)
        (cons el (dupl-element el (1- n)))))

(defun duplicate-elements (lst n)
    (unless (null lst) 
        (append (dupl-element (car lst) n)
            (duplicate-elements (cdr lst) n))))

(defun check-duplicate-elements (name lst n expected)
    (format t "~:[FAILED~;passed~] ~a~%"
        (equal (duplicate-elements lst n) expected)
        name))

(defun test-duplicate-elements ()
  (check-duplicate-elements "test1" '(a b c) 3 '(a a a b b b c c c))
  (check-duplicate-elements "test2" '(a b c) 1 '(a b c))
  (check-duplicate-elements "test3" '() 3 nil))
