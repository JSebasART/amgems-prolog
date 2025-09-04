% Rango de edad - Crear predicado categoria_edad/1.

categoria_edad(X) :-
    X > 0, X =< 13, write('Kid').
categoria_edad(X) :-
    X > 13, X =< 20, write('Teenager').
categoria_edad(X) :-
    X > 20, write('Adult').
    

greet_user :-
    write('Enter age: '), nl,
    read(X),
    categoria_edad(X), nl.

