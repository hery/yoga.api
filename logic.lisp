; turn: p1 or p2
(defparameter *turn* 'p1)
; score: integer from 0 to 3
(defparameter *score* '(0 0))
; state: ready, ask, reply, done
(defparameter *state* 'ready)
; success_counter: integer to swap turn when it reaches 3
(defparameter *success-counter* 0)


(defun start ()
  (print '(let the game begin)))


(defun turn (success)
  (and (update-turn success)
       (update-state success)
       (update-score success)))


(defun update-turn (success)
  (cond ((eq *turn* 'p1) (setf *turn* 'p2))
	((eq *turn* 'p2) (setf *turn* 'p1))
	(t (print '(unknown state during turn)))))


(defun update-state (success)
  (cond ((equal *state* 'ready) (setf *state* 'ask))
	((equal *state* 'ask )  (setf *state* 'reply))
	((equal *state* 'reply) (setf *state* 'ask))))


(defun update-score ()
  ())


; Should we check for MAX_SCORE here?
(defun update-success-ounter (success)
  (if (success)
      (setf *success-counter* (1+ *success-counter*))))


(defun print-state ()
  (and (print *turn*)
       (print *score*)
       (print *state*)
       (print *success_counter*)))
