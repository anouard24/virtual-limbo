

(defun remp (liste)
	"Question 1 (Exam Lisp 2013-2014)"
	(cond
		((null liste)
			nil)
		((evenp (car liste))
			(cons (* 2 (car liste)) (remp (cdr liste))))
		(t 
			(cons (* 3 (car liste)) (remp (cdr liste))))))


(defun isPalindrome (liste &optional liste_backup liste_reversed)
	"Question 1 (Exam Lisp 2014-2015)"
	(cond
		((null liste) (equal liste_backup liste_reversed))
		((null liste_backup) (isPalindrome (cdr liste) liste (list (car liste))))
		(t (isPalindrome (cdr liste) liste_backup (cons (car liste) liste_reversed)))))


(defun elimineOccurs (liste_elt liste)
	"Question 2 (Exam Lisp 2014-2015)"
	(cond
		((null liste) nil)
		((null (member (car liste) liste_elt)) (cons (car liste) (elimineOccurs liste_elt (cdr liste))))
		(t (elimineOccurs liste_elt (cdr liste)))))


(defun moyenne (liste &optional (s 0) (n 0))
	"Question 3 (Exam Lisp 2014-2015)"
	(cond
		((and (null liste) (= n 0)) 0)
		((null liste) (/ s n))
		(t (moyenne (cdr liste) (+ s (car liste)) (+ n 1)))))

(defun moyenne (liste)
	"Question 3 (Exam Lisp 2014-2015)"
	(if (null liste)
		0
		(/ (reduce #'+ liste) (length liste))))
