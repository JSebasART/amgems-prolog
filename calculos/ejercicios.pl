:- [clase10].

% consultas 
% ! Simplificacion simbolica
% 1. Simplifique 
% ?- simplifica(*(1, +(0, X)), R).

% 2. Simplifique 
% ?- simplifica(*(0, +(X, 3)), R).

% 3. Determine el resultado 
% ?- simplifica(+(X, 0), R).

% 4. Ejemplo 
% ?- simplifica(*(1, +(Y, 0)), R).

% ! Derivacion simbolica 
% 5. Calcule la derivada 
% ?- derivada(x*x + 3*x + 2, x, D).

% 6. Derive 
% ?- derivada(x*x*x, x, D).

% 7. Calcule derivada resta 
% ?- derivada(x*x - 4*x + 1, x, D).

% 8. Ejemplo 
% ?- derivada(2*x*x + 5*x + 7, x, D).

% ! Evaluacion simbolica 
% 9. Evalue sust X = 3
% ?- evalua(x*x + 3*x + 2, x, 3, R).

% 10. Determine resultado 
% ?- evalua(x*x - 4*x + 4, x, 2, R).

% 11. Combine derivacion y evaluacion con X = 2
% ?- derivada(x*x + 3*x + 2, x, D), evalua(D, x, 2, R).

% ! Suma de fracciones simbolicas 
% 12. Sume las frac
% ?- suma(frac(1,2), frac(1,3), R).

% 13. Sume las frac 
% ?- suma(frac(2,5), frac(3,10), R).

% 14. cree una regla adicional 
% Resivar el archivo clase 10
% ?- resta(frac(3,4), frac(1,2), R).

% ! Resolucion simbolica 
% 15. Resuelve la ecuacion 
% ?- resuelve(x + 3 = 7, x, V).

% 16. Pruebe el caso 
% ?- resuelve(5 + x = 10, x, V).

% 17. Cree una ecuación nueva y resuélvala simbólicamente (de la forma x + N = M o N + x = M).
% ?- resuelve(x + 8 = 15, x, V).
