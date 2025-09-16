mithology_greek(
    tree(crono,
        tree(rea,
            tree(zeus,
                tree(hades,
                    tree(ares, nil, nil),
                    nil),
                tree(poseidon,
                    tree(hefesto, nil, nil),
                    nil)
            ),
            nil),
        nil)
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