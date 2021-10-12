% Implement the GCD algorithm using Prolog
% See https://en.wikipedia.org/wiki/Euclidean_algorithm#Implementations

% The recursive version of he Euclidean algorithm 
% for computing the GCD  is:
%
% function gcd(a, b)
%     if b = 0
%         return a
%     else
%         return gcd(b, a mod b)


%% TODO -- Define GCD here in Prolog here
gcd(A, 0, C) :- C is A.
gcd(A, B, C) :- B>0, A1 is B, B1 is mod(A,B), gcd(A1, B1, C1), C is C1.

%% Tests
:- gcd(8, 4, X), format('gcd of 8 and 4 is ~f~n', X).
:- gcd(105, 252, X), format('gcd of 105 and 252 is ~f~n', X).
