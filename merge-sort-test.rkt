#lang racket

(require rackunit
         "merge-sort.rkt")

(check-equal? (min-swap '(1 2)) '(1 2))
(check-equal? (min-swap '(1)) '(1))
(check-equal? (min-swap '()) '())
(check-equal? (min-swap '(2 1)) '(1 2))
