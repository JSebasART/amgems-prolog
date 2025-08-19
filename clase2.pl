% mamiferos 
mamifero(leon).
mamifero(vaca).
mamifero(cabra).

% que come cada animal
come(leon,carne).
come(vaca,pasto).
come(cabra,pasto).

% regla: todo mamifero es comida para el leon
comida(X):- mamifero(X), X \= leon.