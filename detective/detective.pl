% cargar la base de conocimiento
:- [base].

% regla: si tiene motivo es sospechoso
motivo_asesinato(X):- motivo(X,_).

% regla: quien estuvo en la biblio
presente(X) :- estuvo(X,Y), Y = biblioteca.

% regla: combine motivo y oportunidad
sospechoso(X) :- motivo_asesinato(X), presente(X).

% buscar arma cuerda 
arma(X) :- acceso(X,Y), Y=cuerda.

% quienes son las personas en la mansion?
:- persona(X).

% quienes tienen motivo?
:- motivo_asesinato(X).

% quien estuvo en la biblio?
:- presente(X).

% descubrir al culpable
culpable(X):- sospechoso(X),arma(X).