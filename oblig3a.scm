(load "prekode3a.scm")

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

;; b
  (define (empty-stream args)
    (cond 
      ((null? args) #f)
      ((stream-null? (car args)) #t)
      (else (empty-stream (cdr args)))))

(define (stream-map proc . argstreams)
  (if (empty-stream argstreams)
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

; c
; Petter har ikke regnet med hva som skjer med uendelige strømmer.
; Siden memq ser gjennom hele listen for å finne en duplikat,
; kommer den til å bli fanget opp i en evig løkke.



  
