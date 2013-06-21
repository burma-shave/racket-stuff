#lang racket

(define SOME-NUMBERS '(5 4 1 8 7 2 6 3 1))

(define (take n xs)
  (cond 
    [(< n 1) '()]
    [(>= n (length xs)) xs]
    [(cons (car xs) (take (- n 1) (cdr xs)))]))

(define (drop n xs)
  (cond 
    [(< n 1) xs]
    [(>= n (length xs)) '()]
    [(drop (- n 1) (cdr xs))]))

(define (split xs)
  (cons (take (/ (length xs) 2) xs) (drop (/ (length xs) 2) xs)))

(define (min-swap xs)
  (cond [(empty? xs) xs] 
        [(empty? (cdr xs)) xs] 
        [(< (car xs) (car (cdr xs))) xs]
        [else (cons (car (cdr xs)) (cons (car xs) '()))]))

(define (generate-numbers n xs)
  (cond [(> n 0) (generate-numbers (- n 1) (cons (random 10000) xs))]
        [else xs]))
 
(define (merge xs ys)
  (cond 
    [(empty? xs) ys]
    [(empty? ys) xs]
    [(<= (car xs) (car ys))
         (cons (car xs) (merge (cdr xs) ys))]
    [else
         (cons (car ys) (merge xs (cdr ys)))]))

(define (merge-sort xs)
  (cond [(<= (length xs) 2) 
         (min-swap xs)]
        [else (merge (merge-sort (car (split xs))) (merge-sort (cdr (split xs))))]))

(provide min-swap)

