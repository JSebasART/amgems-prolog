% Declaramos el predicado estudiante/2 como dinámico.
:- dynamic estudiante/2.

% Hechos iniciales de la base.
estudiante('Ana', programacion).
estudiante('Luis', logica).
estudiante('Carlos', declarativa).

% Consultar todos los estudiantes registrados
listar_estudiantes :-
    writeln('--- Lista de estudiantes ---'),
    estudiante(Nombre, Curso),
    format('~w cursa ~w.~n', [Nombre, Curso]), % Se muestra el nombre y curso del estudiante
    fail. %fail. se usa para forzar que Prolog explore todas las combinaciones y liste todo antes de terminar.
listar_estudiantes.  % Finaliza el backtracking

%listar_estudiantes.

%/////////////////////////////////////////////////////////////////////////////////////

% Agregar nuevo estudiante
agregar_estudiante(Nombre, Curso) :-
    asserta(estudiante(Nombre, Curso)),
    format('Se ha agregado el estudiante: ~w en el curso ~w.~n', [Nombre, Curso]).

% agregar_estudiante('Carlos', declarativa).

%//////////////////////////////////////////////////////////////////////////////////////

% Eliminar un estudiante por nombre
eliminar_estudiante(Nombre) :-
    retract(estudiante(Nombre, Curso)),
    format('Se ha eliminado a ~w del curso ~w.~n', [Nombre, Curso]), % ~w Imprime un término
    !. % evita múltiples eliminaciones

% Eliminar todos los estudiantes
eliminar_todos :-
    retractall(estudiante(_, _)),
    writeln('Todos los estudiantes han sido eliminados de la base.').

% eliminar_estudiante('Luis').

%////////////////////////////////////////////////////////////////////////////////

% Actualizar el curso de un estudiante
actualizar_curso(Nombre, NuevoCurso) :-
    retract(estudiante(Nombre, _)),  % elimina el hecho antiguo
    assert(estudiante(Nombre, NuevoCurso)),  % inserta el nuevo
    format('Se ha actualizado el curso de ~w a ~w.~n', [Nombre, NuevoCurso]),
    !. % evita múltiples actualizaciones

    % actualizar_curso('Ana', inteligencia_artificial).

%//////////////////////////////////////////////////////////////////////////////////////

% Agregar solo si no existe
agregar_unico(Nombre, Curso) :-
    (   estudiante(Nombre, Curso)
    ->  format('El estudiante ~w ya está inscrito en ~w.~n', [Nombre, Curso])
    ;   assert(estudiante(Nombre, Curso)),
        format('Se ha agregado a ~w en el curso ~w.~n', [Nombre, Curso])
    ).

%agregar_unico('Ana', programacion).
%agregar_unico('Sofía', logica).


%actividad replicar la siguiente salida en la consola:
% ==========================================
% SISTEMA DE EMPLEADOS EN PROLOG
% ==========================================

:- dynamic empleado/3.

% --- Base inicial ---
empleado('Ana', contabilidad, 900).
empleado('Luis', sistemas, 1200).
empleado('Sofia', marketing, 1100).

% ==========================================
% Menu principal
% ==========================================
main :-
    writeln('SISTEMA DE EMPLEADOS INICIADO'),
    menu_principal.

menu_principal :-
    repeat,
    writeln('========= MENU ========='),
    writeln('1. Listar empleados'),
    writeln('2. Agregar empleado'),
    writeln('3. Eliminar empleado'),
    writeln('4. Actualizar empleado'),
    writeln('5. Agregar con validacion'),
    writeln('6. Eliminar todos'),
    writeln('0. Salir'),
    writeln('========================'),
    write('Seleccione una opcion: '),
    read(Opcion),
    ejecutar_opcion(Opcion),
    (Opcion = 0 -> ! ; fail).  % salir si elige 0

% ==========================================
% Ejecucion de opciones del menu
% ==========================================
ejecutar_opcion(1) :- listar_empleados, !.
ejecutar_opcion(2) :- agregar_empleado, !.
ejecutar_opcion(3) :- eliminar_empleado, !.
ejecutar_opcion(4) :- actualizar_empleado, !.
ejecutar_opcion(5) :- agregar_unico, !.
ejecutar_opcion(6) :- eliminar_todos, !.
ejecutar_opcion(0) :- writeln('Fin del sistema de empleados.'), !.
ejecutar_opcion(_) :- writeln('Opcion no valida. Intente nuevamente.'), fail.

% ==========================================
% 1. Listar empleados
% ==========================================
listar_empleados :-
    writeln('--- LISTA DE EMPLEADOS ---'),
    empleado(Nombre, Depto, Salario),
    format('Nombre: ~w | Depto: ~w | Salario: $~w~n', [Nombre, Depto, Salario]),
    fail.
listar_empleados :-
    writeln('----------------------------').

% ==========================================
% 2. Agregar empleado
% ==========================================
agregar_empleado :-
    write('Nombre: '), read(Nombre),
    write('Departamento: '), read(Depto),
    write('Salario: '), read(Salario),
    asserta(empleado(Nombre, Depto, Salario)),
    format('Se agrego a ~w en el departamento ~w con salario $~w.~n', [Nombre, Depto, Salario]).

% ==========================================
% 3. Eliminar empleado
% ==========================================
eliminar_empleado :-
    write('Nombre a eliminar: '), read(Nombre),
    retract(empleado(Nombre, Depto, Salario)),
    format('Se elimino a ~w del departamento ~w (salario $~w).~n', [Nombre, Depto, Salario]),
    !.
eliminar_empleado :-
    writeln('No se encontro ese empleado.').

% ==========================================
% 4. Actualizar empleado
% ==========================================
actualizar_empleado :-
    write('Nombre: '), read(Nombre),
    write('Nuevo departamento: '), read(NuevoDepto),
    write('Nuevo salario: '), read(NuevoSalario),
    retract(empleado(Nombre, _, _)),
    asserta(empleado(Nombre, NuevoDepto, NuevoSalario)),
    format('Datos actualizados: ~w -> Depto: ~w | Salario: $~w~n', [Nombre, NuevoDepto, NuevoSalario]),
    !.
actualizar_empleado :-
    writeln('No se encontro el empleado para actualizar.').

% ==========================================
% 5. Agregar con validacion (no duplicar)
% ==========================================
agregar_unico :-
    write('Nombre: '), read(Nombre),
    write('Departamento: '), read(Depto),
    write('Salario: '), read(Salario),
    (   empleado(Nombre, _, _)
    ->  format('El empleado ~w ya existe.~n', [Nombre])
    ;   asserta(empleado(Nombre, Depto, Salario)),
        format('Se agrego a ~w en el departamento ~w con salario $~w.~n', [Nombre, Depto, Salario])
    ).

% ==========================================
% 6. Eliminar todos
% ==========================================
eliminar_todos :-
    retractall(empleado(_, _, _)),
    writeln('Todos los empleados fueron eliminados de la base.').
