#lang racket

(struct post (title body)
  #:transparent)

(struct blog (posts) #:mutable)

(define (blog-insert-post! a-blog a-post)
  (set-blog-posts! a-blog (cons a-post (blog-posts a-blog))))

(provide (all-defined-out))