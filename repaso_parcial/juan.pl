% EJ1: Calculo de area y perimetro 
area_triangulo(B,A,Resultado) :-
	Resultado is ((B * A) /2).

	
% perimetro = suma de sus lados
perimetro_triangulo(A,B,C, Resultado) :-
	Resultado is (A + B + C).
