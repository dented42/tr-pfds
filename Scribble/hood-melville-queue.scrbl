#lang scribble/manual
@(require (for-label "../hood-melville-queue.ss"))
@(require scribble/eval)
@(define evaluate (make-base-eval))
@(evaluate '(require typed/scheme))
@(evaluate '(require "../hood-melville-queue.ss"))
@title{Hood-Melville Queue}

Similar to Real-Time Queues in many ways. But the implementation is
much more complicated than Real-Time Queue. Uses a technique called 
@italic{Global Rebuilding}. The data structure gives a worst case 
running time of @bold{@italic{O(1)}} for the operations 
@scheme[head], @scheme[tail] and @scheme[enqueue].

@;section{Hood-Melville Construction and Operations}

@defproc[(queue [a A] ...) (Queue A)]{
Function @scheme[queue] creates a Hood-Melville with the 
given inputs. 
@examples[#:eval evaluate

(queue 1 2 3 4 5 6)
]

In the above example, the queue obtained will have 1 as its head element.}


@defthing[empty (Queue Nothing)]{
An empty queue.}

@defproc[(empty? [que (Queue A)]) Boolean]{
Function @scheme[empty?] checks if the given queue is empty or not.

@examples[#:eval evaluate

(empty? (queue 1 2 3 4 5 6))

(empty? empty)
]}

@defproc[(enqueue [a A] [que (Queue A)]) (Queue A)]{
Function @scheme[enqueue] takes an element and a queue and enqueues 
the given element into the queue. 
@examples[#:eval evaluate

(enqueue 10 (queue 1 2 3 4 5 6))
]

In the above example, enqueue adds the element 10 to
@scheme[(queue 1 2 3 4 5 6)] and returns @scheme[(queue 1 2 3 4 5 6 10)].}

@defproc[(head [que (Queue A)]) A]{
Function @scheme[head] takes a queue and gives the first element in the
queue if queue is not empty else throws an error. 
@examples[#:eval evaluate

(head (queue 1 2 3 4 5 6))
(head empty)
]}

@defproc[(tail [que (Queue A)]) (Queue A)]{
Function @scheme[tail] takes a queue and returns a queue with rest 
elements if its a non empty queue else throws an error. 
@examples[#:eval evaluate

(tail (queue 1 2 3 4 5 6))

(tail empty)
]

In the above example, @scheme[(tail (queue 1 2 3 4 5 6))], returns
@scheme[(queue 2 3 4 5 6)].}


@defproc[(queue->list [que (Queue A)]) (Queue A)]{
Function @scheme[queue->list] takes a queue and returns a list of 
elements. The list will have head of the given queue as its first element.
If the given queue is empty, then it returns an empty list. 
For 
@examples[#:eval evaluate

(queue->list (queue 10 2 34 4 15 6))
(queue->list empty)
]}
