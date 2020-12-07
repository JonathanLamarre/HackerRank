let rec print_list a = match a with
    | []    -> ()
    | e::[] -> print_int e
    | e::t  -> print_int e; print_string " "; print_list t

let rec print_list_list a = match a with
    | []    -> ();
    | e::[] -> print_list e
    | e::t  -> print_list e; print_newline (); print_list_list t

let pascal n =
    let rec f m a = if (m < 1)
        then List.rev a
        else f (m - 1) (List.rev_map2 (+) (0::(List.hd a)) (List.rev (0::(List.hd a)))::a)
    in f (n - 1) [[1]]

let _ = print_list_list (pascal (read_int ()))