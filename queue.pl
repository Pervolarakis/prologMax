dequeue(X, [X|T], T). 

enqueue(X, [], [X]).
enqueue(X, [H|T1], [H|T2]) :- enqueue(X, T1, T2).

get_elem_queue(X, [X|T]). 

empty_queue([]).
 
 
prog:-
   empty_queue(Stack),
    readNums(Stack,0).
   
readNums(Set, 4):-
    get_elem_queue(H, Set),
    dequeue(H,Set, T),
    findMaX(T, H).
   
readNums(Set, Cnt):-
    nl,
    write('dose arithmo'),
    read(Num),
    enqueue(Num, Set, NSet),
    Ncnt is Cnt+1,
    readNums(NSet, Ncnt).
 
findMaX([], Max):-
    write(Max).
   
findMaX(Set, MaX):-
    get_elem_queue(H, Set),
    H > MaX,
    dequeue(H, Set, T), 
    findMaX(T, H).
 
findMaX(Set, MaX):-
    get_elem_queue(H, Set),
    H =< MaX,
    dequeue(H, Set, T),
    findMaX(T, MaX).