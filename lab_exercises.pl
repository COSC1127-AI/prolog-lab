%% =============================================================
%% NOTE! Use `languages_database_predicates.pl` for these rules.
%% =============================================================


%! `is_child/2`
is_child(X,Y) :- is_parent(Y,X).


%! `is_spoken/1`
is_spoken(X) :- is_language(X), \+ is_extinct(X).


%! `is_sibling/2`
is_sibling(X,Y) :-
    is_parent(Z,X),
    is_parent(Z,Y),
    X \= Y.


%! `is_cousin/2`
is_cousin(X,Y) :-
    is_parent(A,X),
    is_parent(B,Y),
    is_sibling(A,B),
    X \= Y.


%! `is_grandparent/2`
is_grandparent(X,Y) :- is_parent(X,Z), is_parent(Z,Y).


%! `is_ancestor/2`
is_ancestor(X,Y) :- is_parent(X,Y).
is_ancestor(X,Y) :- is_parent(X,Z), is_ancestor(Z,Y).


%! `is_descendant/2`
is_descendant(X,Y) :- is_child(X,Y).
is_descendant(X,Y) :- is_child(X,Z), is_descendant(Z,Y).


%! `share_ancestor/3`
share_ancestor(X,Y,Z) :- is_ancestor(Z,X), is_ancestor(Z,Y), X \= Y.


%! `share_recent_ancestor/3`
share_recent_ancestor(X,Y,A) :-
    share_ancestor(X,Y,A),
    \+ (
        is_parent(A,B),
        share_ancestor(X,Y,B)
    ).


%! `has_size/2`
has_size([],0).
has_size([_|T],N) :- has_size(T,M), N is M + 1.


%! `contains/2`
contains([H|_],H).
contains([H|T],X) :- H \= X, contains(T,X).


%! `is_concatenated/3`
is_concatenated([],L,L).
is_concatenated([X|A],L,[X|B]) :- is_concatenated(A,L,B).


%! `are_languages_related/2`
are_languages_related([],[]).
are_languages_related([languages(X,Y)|A],[areRelated(X,Y)|B]) :-
    share_recent_ancestor(X,Y,_),
    are_languages_related(A,B).
are_languages_related([languages(X,Y)|A],[notRelated(X,Y)|B]) :-
    \+ share_recent_ancestor(X,Y,_),
    are_languages_related(A,B).
are_languages_related([X|A],B) :- % Challenge exercise.
    X \= areRelated(_,_),
    are_languages_related(A,B).


%% ========================================================
%% NOTE! Use `languages_database_lists.pl` for these rules.
%% ========================================================


%! `has_descendants/2`.
has_descendants(X,[X])   :- \+ is_parent(X,_).
has_descendants(X,[X|Y]) :-    is_parent(X,Z), have_descendants(Z,Y).

%! `have_descendants/2`. Auxiliary predicate for `has_descendants/2`.
have_descendants([],[]).
have_descendants([X|Y],Z) :- has_descendants(X,A), have_descendants(Y,B), is_concatenated(A,B,Z).


%! `has_spoken_descendants/2`.
has_spoken_descendants(X,0) :- \+ is_parent(X,_),    is_extinct(X).
has_spoken_descendants(X,1) :- \+ is_parent(X,_), \+ is_extinct(X).
has_spoken_descendants(X,N) :-    is_parent(X,Y),    is_extinct(X), have_spoken_descendants(Y,N).
has_spoken_descendants(X,N) :-    is_parent(X,Y), \+ is_extinct(X), have_spoken_descendants(Y,M), N is M + 1.

%! `have_spoken_descendants/2`. Auxiliary predicate for `has_spoken_descendants/2`.
have_spoken_descendants([],0).
have_spoken_descendants([X|Y],N) :- has_spoken_descendants(X,A), have_spoken_descendants(Y,B), N is A + B.
