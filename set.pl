member_set(X, [H|T]) :- X = H.
member_set(X, [H|T]) :- X \= H, member_set(X, T).
 
insert_elem_set(X, S1, S1) :- member_set(X, S1).
insert_elem_set(X, S1, [X|S1]) :- \+ member_set(X, S1).
 
head([H|T], H).
 
delete_elem_set(X, [X|T1], T1).
delete_elem_set(X, [H1|T1], [H1|T2]) :- delete_elem_set(X, T1, T2).
 
empty_set([]).
 
 
prog:-
   
    readNums([],0).
   
readNums(Set, 4):-
    head(Set, H),
    delete_elem_set(H, Set, T),
    findMaX(T, H).
   
readNums(Set, Cnt):-
    nl,
    write('dose arithmo'),
    read(Num),
    insert_elem_set(Num, Set, NSet),
    Ncnt is Cnt+1,
    readNums(NSet, Ncnt).
 
findMaX([], MaX):-
    write(MaX).
   
findMaX(Set, MaX):-
    head(Set, H),
    H > MaX,
    delete_elem_set(H, Set, T),
    findMaX(T, H).
 
findMaX(Set, MaX):-
    head(Set, H),
    H =< MaX,
    delete_elem_set(H, Set, T),
    findMaX(T, MaX).