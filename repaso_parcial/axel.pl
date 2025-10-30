%Ejercicio para saber si un numero es par o impar
par_o_impar :-
    write('Ingrese un numero'), read(Numero),
    Resultado is Numero mod 2,
    (   Resultado =:= 0
        ->write(Numero), write('SI es par'),nl
        : write(Numero), write('No es par'), nl
    ).
