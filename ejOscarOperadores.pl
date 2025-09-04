categoria_edad(Edad) :-
    Edad >= 0, Edad =< 12,
    write('Niño').

categoria_edad(Edad) :-
    Edad >= 13, Edad =< 17,
    write('Adolescente').

categoria_edad(Edad) :-
    Edad >= 18, Edad =< 64,
    write('Adulto').

categoria_edad(Edad) :-
    Edad >= 65,
    write('Adulto mayor').
