#lang typed/racket
(require "../deque/bankers.rkt")
(require typed/test-engine/scheme-tests)

(check-expect (empty? (empty Nothing)) #t)
(check-expect (empty? (deque 1 2 3)) #f)

(check-expect (head (deque 1 2 3)) 1)
(check-expect (head (deque 5 6 2 3)) 5)
(check-error (head (empty Nothing)) "head: given deque is empty")

(check-expect (last (deque 1 2 3)) 3)
(check-expect (last (deque 5 6 2 8)) 8)
(check-error (last (empty Nothing)) "last: given deque is empty")

(check-expect (deque->list (tail (deque 1 2 3))) (list 2 3))
(check-expect (deque->list (tail (deque 1 2 3 5 7 8)))
              (list 2 3 5 7 8))
(check-error (tail (empty Nothing)) "tail: given deque is empty")

(check-expect (deque->list (init (deque 1 2 3))) (list 1 2))
(check-expect (deque->list (init (deque 1 2 3 5 7 8)))
              (list 1 2 3 5 7))
(check-error (init (empty Nothing)) "init: given deque is empty")

(check-expect (deque->list (enqueue 1 (empty Integer))) (list 1))
(check-expect (deque->list (enqueue 4 (deque 1 2))) (list 1 2 4))

(check-expect (deque->list (enqueue-front 1 (empty Integer))) (list 1))
(check-expect (deque->list (enqueue-front 4 (deque 1 2))) (list 4 1 2))

(define lst (build-list 100 (λ: ([x : Integer]) x)))

(check-expect (deque->list 
               (enqueue-front 40 (enqueue-front 4 (apply deque lst)))) 
              (cons 40 (cons 4 lst)))

(check-expect (deque->list (apply deque lst)) lst)

(check-expect (deque->list (map + (deque 1 2 3 4 5) (deque 1 2 3 4 5)))
              (list 2 4 6 8 10))

(check-expect (deque->list (map - (deque 1 2 3 4 5) (deque 1 2 3 4 5)))
              (list 0 0 0 0 0))

(check-expect (foldl + 0 (deque 1 2 3 4 5)) 15)

(check-expect (foldl - 2 (deque 1 2 3 4 5)) -13)

(check-expect (foldr + 0 (deque 1 2 3 4 5)) 15)

(check-expect (foldr + 0 (deque 1 2 3 4 5) (deque 1 2 3 4 5)) 30)

(check-expect (deque->list (filter positive? (deque 1 2 -4 5 0 -6 12 3 -2)))
              (list 1 2 5 12 3))

(check-expect (deque->list (filter negative? (deque 1 2 -4 5 0 -6 12 3 -2)))
              (list -4 -6 -2))

(check-expect (deque->list (remove positive? (deque 1 2 -4 5 0 -6 12 3 -2)))
              (list -4 0 -6 -2))

(check-expect (deque->list (remove negative? (deque 1 2 -4 5 0 -6 12 3 -2)))
              (list 1 2 5 0 12 3))


(test)
