; turn: p1 or p2
(defparameter *turn* 'p1)
; score: integer from 0 to 3
(defparameter *score* '(0 0))
; state: ready, ask, reply, done
(defparameter *state* 'ready)
; success_counter: integer to swap turn when it reaches 3
(defparameter *success-counter* 0)


(defun start ()
  (setf *state* 'ask))


(defun turn ()
  (progn (update-turn)
	 (update-state)
	 (update-score)))


(defun update-turn ()
  (cond ((eq *turn* 'p1) (setf *turn* 'p2))
	((eq *turn* 'p2) (setf *turn* 'p1))
	(t (print '(unknown state during turn)))))


(defun update-state ()
  (cond ((equal *state* 'ready) (setf *state* 'ask))
	((equal *state* 'ask )  (setf *state* 'reply))
	((equal *state* 'validate) (setf *state* 'ask))
	((equal *state* 'reply) (setf *state* 'validate))))


; tentative alternative API
; (turn 'ask)
; (turn 'reply image)
; (turn 'validate 't) or (turn 'validate nil)

; Question: Can we structure our API like a REPL?
; e.g. Payload = turn validate t token
;                turn reply image token

(defun update-score ()
  ())


; Should we check for MAX_SCORE here?
(defun update-success-counter (success)
  (if (eq success t)
      (setf *success-counter* (1+ *success-counter*))))


(defun print-state ()
  (and (print *turn*)
       (print *score*)
       (print *state*)
       (print *success-counter*)))

