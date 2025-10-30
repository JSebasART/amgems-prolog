%Base de conomiento de estudiantes
estudiante(victor).
estudiante(rene).
estudiante(axel).
estudiante(sebastian).
estudiante(melissa).
estudiante(carla).
estudiante(grecia).


%Consultas
no_es_estudiante(Nombre) :-
    \+ estudiante(Nombre).

primer_estudiante(X) :-
    estudiante(X),
    !.

listar_estudiantes :-
    estudiante(X),
    write(X), nl,
    fail.

es_estudiante :-
    write('Ingrese un nombre: '), read(Nombre),
    (   estudiante(Nombre)
    ->  write(Nombre), write(' SI es estudiante'), nl
    ;   write(Nombre), write(' NO es estudiante'), nl
    ).


:- no_es_estudiante(ellacuria).
:- primer_estudiante(victor).
:- listar_estudiantes.
:- es_estudiante.
