% author: Anouar Fadili (anouard24)
% 2019/06/16
% 
% facts:

% med is a man
man(med).
man(rachid).
man(said).
% med is the father of rachid
father(med, rachid).
father(med, said).
woman(khadija).
father(med, khadija).
mother(malika, med).
father(ali, med).

% rules:

% X is a parent of Y if X is the mother of Y
parent(X, Y) :- mother(X, Y).
% or if X is the father of Y
parent(X, Y) :- father(X, Y).

% X is a grandfather of Y
% if he is a father of a parent of Y
grandfather(X, Y) :- father(X, Z), parent(Z, Y).
grandmother(X, Y) :- mother(X, Z), parent(Z, Y).

% X is a brother of Y if:
brother(X, Y) :-
    man(X), % he is a man
    parent(Z, X), % he has 
    parent(Z, Y), % the same parent of Y
    X \== Y. % and X can't be a brother of himself

% the relation is bidirectional
brother(X, Y) :-
    man(X),
    man(Y),
    brother(Y, X).


sister(X, Y) :-
    woman(X),
    parent(Z, X),
    parent(Z, Y),
    X \== Y.

sister(X, Y) :-
    woman(X),
    woman(Y),
    sister(Y, X).
