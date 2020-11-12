;; created in spring 2019
; author: Anouar Fadili @anouard24

;; Factorielle d'un nombre
(defun fact (n)
	"Factorielle d'un nombre - version recursive non terminale"
	(if (< n 2)
		1
		(* n (fact (- n 1)))))

(defun fact (n &optional (acc 1))
	"Factorielle d'un nombre - version recursive terminale"
	(if (< n 2)
		acc
		(fact (- n 1) (* acc n))))

(defun fact (n)
	"Factorielle d'un nombre - version iterative"
	(let ((acc 1))
		(dotimes (i n acc)
			(setq acc (* acc (+ i 1))))))



;; La longeur d'un tableau
(defun len (liste)
	"(length liste) version recursive"
	(if (null liste)
		0
		(+ 1 (len (cdr liste)))))

(defun len (liste)
	"(length liste) version iterative"
	(let ((l 0)) ; def d'une var local
		(dolist (x liste l) ; parcours de la liste
			(incf l)))) ; incrementation de l

(defun len (liste)
	"(length liste) - version fonctionelle"
	(apply #'+ (mapcar #'(lambda (x) 1) liste)))



;; fonction maximum d'une liste d'entiers
(defun max-list (liste)
	"Maximum d'une liste - version recursive"
	(if (null (cdr liste))
		(car liste)
		(let ((mx (max-list (cdr liste)))) ; appel recursif
			(if (> mx (car liste))
				mx
				(car liste)))))

(defun max-list (liste)
	"Maximum d'une liste - version iterative"
	(let ((mx (car liste)))
		(dolist (x (cdr liste) mx)
			(setf mx (if (> mx x) mx x)))))

(defun max-list (liste)
	"Maximum d'une liste - version fonctionelle"
	(if (null liste) 
		nil
		(reduce #'(lambda (a b) (if (> b a) b a)) liste)))


;; Le dernier element d'une liste
(defun dernier (liste)
	"Une implémentation du la fonction (last liste) - recursive "
	(if (null (cdr liste))
		(car liste)
		(dernier (cdr liste))
		))

(defun dernier (liste)
	"Une implémentation du la fonction (last liste) - iterative "
	(let ((d))
		(dolist (x liste d) (setf d x))))

(defun dernier (liste)
	"Une implémentation du la fonction (last liste) - fonctionelle "
	(if (null liste)
		nil
		(reduce #'(lambda (a b) b) liste)))


;; Variante de member , (existe valeur liste)
;; puisque member ne marche pas avec les liste imbriquee 
;; (member '(4 5) '(8 7 (4 5) 9)) => nil (mais on attend ((4 5) 9) comme resultat)
(defun existe (v liste) 
	"T si v existe dans la liste liste - version recursive"
	(cond 
		((null liste) nil)
		((equal (car liste) v) T)
		(T (existe v (cdr liste)))))

(defun existe (v liste) 
	"T si v existe dans la liste liste - version fonctionelle"
	(reduce #'(lambda (a b) (or a b)) (mapcar #'equal liste (mapcar #'(lambda (x) v) liste))))


;; Elimine les elements redondants d'un element e dans une liste L.
(defun rem-double-element (e liste &optional dp)
	"Supprimer les doublants de e dans la liste"
	(cond 
		((null liste) nil)
		((and (not dp) (equal (car liste) e)) (cons (car liste) (rem-double e (cdr liste) t)))
		((equal (car liste) e) (rem-double e (cdr liste) dp))
		(t (cons (car liste) (rem-double e (cdr liste) dp)))))



;; Elimine les elements redondants dans une liste L.
(defun rem-double (liste)
	"Supprimer les doublants de la liste - recursive"
	(cond 
		((null liste) nil)
		((existe (car liste) (cdr liste)) (rem-double (cdr liste)))
		(t (cons (car liste) (rem-double (cdr liste))))))

(defun rem-double (liste)
	"Supprimer les doublants de la liste - iterative"
	(let ((l nil))
		(dolist (x liste l)
			(if (not (existe x l)) (push x l)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun map-int (fn n)
	"Fonction depuis le livre 'ANSI Commom Lisp' de 'Paul Graham' (page 105)"
	(let ((acc nil))
		(dotimes (i n)
			(push (funcall fn i) acc))
		(nreverse acc)))

(defun matrix (i j v)
	"Renvoie une matrice (liste de listes) remplie avec la valeur v"
	(let ((matrice nil))
		(dotimes (k i) (push (map-int #'(lambda (x) v) j) matrice))
		(reverse matrice)))

(defun set-ij (matrice i j v)
	"Affecte la valeur v a matrice[i][j]"
	(setf (nth j (nth i matrice)) v))

(defun get-ij (tab i j)
	"Renvoie la valeur matrice[i][j]"
	(nth j (nth i tab)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Exemples de la récursivité (exemples similaire du cours)
(defun membre (e L)
	"Une implémentation du la fonction (member element liste)"
	(if (or (null L) (equal e (car L)))
		L
		(membre e (cdr L))))

(defun concatene (L1 L2)
	"Une implémentation du la fonction (append liste1 liste2)"
	(if (null L1)
		L2
		(cons (car L1) (concatene (cdr L1) L2))))

(defun renverse (liste)
	"Une implémentation du la fonction (reverse liste)"
	(if (null (cdr liste))
		liste
		(append (renverse (cdr liste)) (list (car liste)))))

(defun substitue (e1 e2 liste)
	"Une implémentation du la fonction (subst e1 e2 liste)"
	(cond
		((null liste) nil)
		((atom liste) (if (equal e2 liste) e2 liste))
		((equal (car liste) e2) (cons e1 (substitue e1 e2 (cdr liste))))
		(t (cons (car liste) (substitue e1 e2 (cdr liste))))))

