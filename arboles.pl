% los giegos
arbogriego(
    arbol(crono,
        arbol(rea,
            arbol(zeus,
                arbol(hades,
                    arbol(ares, nil, nil),
                    nil
                ),
                arbol(poseidon,
                    nil,
                    arbol(hefesto, nil, nil)
                )
            ),
            nil
        ),
        nil
    )
).

% los nordicos 
arbol_nordico(
    arbol(odin,
        arbol(frigg,
            arbol(thor,
                arbol(balder,
                    arbol(magni, nil, nil),
                    nil
                ),
                arbol(hodr,
                    arbol(modi, nil, nil),
                    nil
                )
            ),
            nil
        ),
        nil
    )
).

preorder(nil, []).
preorder(tree(Value, Left, Right), List) :-
    preorder(Left, LeftList),
    preorder(Right, RightList),
    append([Value|LeftList], RightList, List).

postorder(nil, []).
postorder(tree(Value, Left, Right), List) :-
    postorder(Left, LeftList),
    postorder(Right, RightList),
    append(LeftList, RightList, Temp),

    append(Temp, [Value], List).
