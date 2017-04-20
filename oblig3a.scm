(load "prekoda3a.scm")

;a1

(define (list-to-stream liste)
  (define (stream-iter liste)
    (if(null? liste)
       '()
       (cons-stream (car liste) (stream-iter (cdr liste)))))
  (stream-iter liste))

;a2-3

(define (stream-to-list liste max)
  (define (stream-iter liste counter)
    (if (or (equal? counter max) (stream-null? liste))
       '()
       (cons (stream-car liste) (stream-iter (stream-cdr liste) (+ counter 1)))))
  (stream-iter liste 0))



