

(defun moyennePonderee (L P &optional (a 0) (n 0))
	"Question 1 (Exam Lisp 2011-2012)"
	(if (null L)
		(if (zerop n) 0 (/ a n))
		(moyennePonderee (cdr L) (cdr P) (+ a (* (car L) (car P))) (+ n 1))))


(defun applatir (liste)
	"Question 2 (Exam Lisp 2011-2012)"
	(cond
		((null liste) nil)
		((listp (car liste)) (append (applatir (car liste)) (applatir (cdr liste))))
		(t (cons (car liste) (applatir (cdr liste))))))


(defun alt (liste &optional num)
	"Question 1 (Controle Lisp 2012-2013)"
	(cond 
		((null liste) t)
		((null num)
			(if (symbolp (car liste))
				(alt (cdr liste) t)
				nil))
		(t	(if (numberp (car liste))
				(alt (cdr liste) nil)
				nil))))


(defun addb (s liste &optional (sm 0))
	"Question 2 (Controle Lisp 2012-2013)"
	(cond 
		((null liste) sm)
		((and (numberp (car liste)) (> (car liste) s)) (addb s (cdr liste) (+ sm (car liste))))
		(t (addb s (cdr liste) sm))))


(defun memb (e liste)
	"Question 3 (Controle Lisp 2012-2013)"
	(cond
		((null liste) nil)
		((equal e (car liste)) t)
		((listp (car liste)) (or (memb e (car liste)) (memb e (cdr liste))))
		(t (memb e (cdr liste)))))


(defun red (liste &optional lsd)
	"Question 4 (Controle Lisp 2012-2013)"
	(cond
		((null liste) lsd)
		((member (car liste) lsd) (red (cdr liste) lsd))
		(t (red (cdr liste) (append lsd (list (car liste)))))))


