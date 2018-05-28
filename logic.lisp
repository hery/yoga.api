; turn: p1 or p2
(defparameter *turn* 'p1)


; score: integer from 0 to 3
(defparameter *score* '(0 0))


; state: ready, ask, reply
(defparameter *state* 'ready)


; success_counter: integer to swap turn when it reaches 3
(defparameter *success_counter* 0)


(defun start ()
  (print '(let the game begin)))


(defun turnGlobal (success)
  (and (updateTurn success)
       (updateState success)))


(defun updateTurn (success)
  (cond ((eq *turn* 'p1) (setf *turn* 'p2))
	((eq *turn* 'p2) (setf *turn* 'p1))
	(t (print '(unknown state during turn)))))


(defun updateState (success)
  (cond ((equal *state* 'ready) (setf *state* 'ask))
	((equal *state* 'ask )  (setf *state* 'reply))
	((equal *state* 'reply) (setf *state* 'ask))))


; Should we check for MAX_SCORE here?
(defun updateSuccessCounter (success)
  (if (success)
      (setf *success_counter* (1+ *success_counter*))))


; Omitting the else is valid in CL
(defparameter *test-counter* 0)
(defun testInc (test-cond)
  (if '(test-cond)
      (setf *test-counter* (1+ *test-counter*))))

