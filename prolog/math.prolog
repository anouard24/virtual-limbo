% author: Anouar Fadili (anouard24)
% 2019/05/28
% 

% facts
fib(0, 1).
fib(1, 1).
% the rule
fib(N, F) :-
    M is N-1,
    fib(M, FM),
    L is N-2,
    fib(L, FL),
    F is FM+FL.


% fact
factorial(0, 1).
% the rule N! = F
factorial(N, F) :-
    M is N - 1,
    factorial(M, FM),
    F is N * FM.
