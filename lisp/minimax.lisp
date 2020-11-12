; minimax algorithm implementation in lisp
; author: Anouar Fadili @anouard24
; Spring 2019

(defun minimax (tree isMax)
	"Retourne la valeur de l'application de l'algorithme de minimax sur un arbre."
	(if (second tree)
		(eval 
			(set 
				(first tree)
				(if isMax
					(apply #'max 
						(mapcar #'minimax 
							(second tree) 
							(mapcar #'(lambda (x) nil) (second tree))))
					(apply #'min 
						(mapcar #'minimax 
							(second tree) 
							(mapcar #'(lambda (x) t  ) (second tree)))))))
		(eval (first tree))))


; variable definition
(setq 	x 11
		y 12
		z 13 )
; tree definition
(set 
	'tree 
	'(x ((y 
			((60 nil) 
			 (85 nil) 
			 (70 nil))) 
		 (z ((51 nil) 
		 	 (67 nil) 
			 (78 nil) 
			 (90 nil) 
			 (84 nil) 
			 (32 nil))))))

; call minimax as max
(minimax tree t)
; x, y and z are modified after minimax
; in this exemple: (x 60) (y 60) (z 32)

; call minimax as min
(minimax tree nil)
