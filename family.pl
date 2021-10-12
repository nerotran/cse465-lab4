% Famuly Tree

% Facts 
male(jack).
male(oliver).
male(ali).
male(james).
male(simon).
male(harry).
female(helen).
female(sophie).
female(jess).
female(lily).
female(sarah).

parent_of(jack,jess). % jack is the parent of jess
parent_of(jack,lily).
parent_of(jack, sarah).
parent_of(helen, jess).
parent_of(helen, lily).
parent_of(oliver,james).
parent_of(sophie, james).
parent_of(jess, simon).
parent_of(ali, simon).
parent_of(lily, harry).
parent_of(james, harry).
 
% Rules 
%  NOTE: If possible, avoid using 
%        disjunction (;) in your rules

% TODO: Write father_of/2
father_of(X,N) :- male(X), parent_of(X,N).
 
% TODO: Write mother_of/2
mother_of(X,N) :- female(X), parent_of(X,N).

% TODO: Write grandfather_of/2
grandfather_of(X,N) :- father_of(X,F), male(F), father_of(F,N).
grandfather_of(X,N) :- father_of(X,F), female(F), mother_of(F,N).
 
% TODO: Write grandmother_of/2
grandmother_of(X,N) :- mother_of(X,F), male(F), father_of(F,N).
grandmother_of(X,N) :- mother_of(X,F), female(F), mother_of(F,N).

% TODO: Write sister_of/2
%      HINT: Use multiple clauses instead of disjunction
sister_of(X,N) :- parent_of(F,N), parent_of(F,X), female(X), X \= N. 

% TODO: Write aunt_of/2
aunt_of(X,N) :- parent_of(P,N), sister_of(X,P).
 
% TODO: Write ancestor_of
ancestor_of(X,N) :- parent_of(X,N).
ancestor_of(X,N) :- grandfather_of(X,N).
ancestor_of(X,N) :- grandmother_of(X,N).

%% Tests

:- mother_of(X, jess), format('The mother of ~w is ~w~n', [jess,X]).
:- father_of(X, jess), format('The father of ~w is ~w~n', [jess,X]).

:- setof(X, grandfather_of(X, harry), Set),
   forall(member(G, Set), format('A grandfather of ~w is ~w~n', [harry,G])).

:- setof(X, grandmother_of(X, harry), Set),
   forall(member(G, Set), format('A grandmother of ~w is ~w~n', [harry,G])).

:- setof(X, ancestor_of(X, harry), Ancestors), 
   forall(member(A, Ancestors), format('~w is an ancestor of ~w~n', [A, harry])).

:- setof(C, sister_of(C, lily), Sisters), 
   forall(member(S, Sisters), format('~w is ~w\'s sister~n', [S, lily])).

:- setof(C, aunt_of(C, harry), Set), 
   forall(member(S, Set), format('~w is ~w\'s aunt~n', [S, harry])).


