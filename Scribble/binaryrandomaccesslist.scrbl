#lang scribble/manual

@title[#:tag "bral"]{Binary Random Access List}

Random Access Lists are list data structures that provide array-like lookup 
and update operations. They have been implemented as a framework of binary 
numerical representation using complete binary leaf trees. It has a worst 
case running time of @bold{@italic{O(log(n))}} for the operations
@italic{kons, head, tail, lookup and update}.

@section{Binary Random Access List Constructor and Operations}

@subsection{ralist}
The function ralist creates a Binary Random Access List with the given 
inputs. For example,
@schememod[
typed-scheme
(require "binaryrandomaccesslist.ss")

(ralist 1 2 3 4 5 6)
]

In the above example, @scheme[(ralist 1 2 3 4 5 6)] gives a Binary Random 
Access List which is similar to lists but comes with efficient lookup and 
update operations.

@subsection{empty}
A empty ralist

@subsection{empty?}
The function @scheme[empty?] takes a Binary Random Access List checks if the 
given ralist is empty. For example,
@schememod[
typed-scheme
(require "binaryrandomaccesslist.ss")

(define ral (ralist 1 2 3 4 5 6))

(empty? ral)

(empty? empty)
]

In the above example, @scheme[(empty? ral)] returns @scheme[#f] and 
@scheme[(empty? empty)] returns @scheme[#t].


@subsection{kons}
The function @scheme[kons] takes an element and a ralist and adds the given 
element to the front of the given list. For example,
@schememod[
typed-scheme
(require "binaryrandomaccesslist.ss")

(define ral (ralist 1 2 3 4 5 6))

(kons 10 ral)
]

In the above example, @scheme[(kons 10 ral)] returns 
@scheme[(ralist 10 1 2 3 4 5 6)].


@subsection{head}
The function @scheme[head] takes a ralist and returns the first element
of the given ralist. For example,
@schememod[
typed-scheme
(require "binaryrandomaccesslist.ss")

(define ral (ralist 1 2 3 4 5 6))

(head ral)
]

In the above example, @scheme[(head ral)] returns 1, the first element
of the the given ralist.


@subsection{tail}
The function @scheme[tail] takes a ralist and returns the given ralist but
without its first element. For example,
@schememod[
typed-scheme
(require "binaryrandomaccesslist.ss")

(define ral (ralist 1 2 3 4 5 6))

(tail ral)
]

In the above example, @scheme[(tail ral)] returns the rest of the given 
ralist, @scheme[(ralist 2 3 4 5 6)].


@subsection{lookup}
The function @scheme[lookup] takes an integer(say n) and a ralist and gives
the nth element of the given ralist

For example,
@schememod[
typed-scheme
(require "binaryrandomaccesslist.ss")

(define ral (ralist 1 2 3 4 5 6))

]

In the above example, @scheme[(lookup 0 ral)] returns 1, 
@scheme[(lookup 1 ral)] gives 2 and so on. If the list is empty or if the 
index is larger than the number of elements in the ralist, then it throws
an error.


@subsection{update}
The function @scheme[update] takes an integer(say n), ralist and a new
element. And updates the nth element of the ralist with the new element.

For example,
@schememod[
typed-scheme
(require "binaryrandomaccesslist.ss")

(define ral (ralist 1 2 3 4 5 6))

(update 0 ral 10)
]

In the above example, @scheme[(update 0 ral 10)] returns 
@scheme[(ralist 10 2 3 4 5 6)], 
@scheme[(update 4 ral 100)] gives @scheme[(ralist 1 2 3 4 100 6)]. 
If index is larger than the number of elements in the ralist, then it 
throws an error.


@subsection{ralist->list}
The function @scheme[ralist->list] takes a ralist and returns a list
of elements which are in the same order as in the ralist. For example,
@schememod[
typed-scheme
(require "binaryrandomaccesslist.ss")

(define ral (ralist 1 2 3 4 5 6))

(ralist->list ral)
]

In the above example, @scheme[(ralist->list ral)] returns
@scheme[(ralist 1 2 3 4 5 6)].


@subsection{drop}
The function @scheme[drop] takes a ralist and an integer(say n) and drops 
the first n elements of the input ralist and returns the rest of the list. 
For example,
@schememod[
typed-scheme
(require "binaryrandomaccesslist.ss")

(define ral (ralist 1 2 3 4 5 6))

(drop ral 3)
]

In the above example, @scheme[(drop ral 3)] returns the ralist,
@scheme[(ralist 3 4 5 6)]. @scheme[(drop ral 0)] returns the ralist,
@scheme[(ralist 1 2 3 4 5 6)]. If the given n is larger than the number of 
elements in the ralist, then it throws an error.



@subsection{list-length}
The function @scheme[list-length] takes a ralist and gives the number of 
elements in in the given ralist. 
For example,
@schememod[
typed-scheme
(require "binaryrandomaccesslist.ss")

(define ral (ralist 1 2 3 4 5 6))

(list-length ral)
]

In the above example, @scheme[(list-length ral)]  gives 7. 
@scheme[(list-length empty)] returns 0.
