pop([H|T], T).

push(Q, X, [X|Q]).

top([H|T], H).

empty_stack([]).
 
 
prog:-
   empty_stack(Stack),
    readNums(Stack,0).
   
readNums(Set, 4):-
    top(Set, H),
    pop(Set, T),
    findMaX(T, H).
   
readNums(Set, Cnt):-
    nl,
    write('dose arithmo'),
    read(Num),
    push(Set, Num, NSet),
    Ncnt is Cnt+1,
    readNums(NSet, Ncnt).
 
findMaX([], Max):-
    write(Max).
   
findMaX(Set, MaX):-
    top(Set, H),
    H > MaX,
    pop(Set, T),
    findMaX(T, H).
 
findMaX(Set, MaX):-
    top(Set, H),
    H =< MaX,
    pop(Set, T),
    findMaX(T, MaX).