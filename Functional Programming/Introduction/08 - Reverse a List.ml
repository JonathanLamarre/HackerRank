let rec read_list_inverted a =
    try
        read_list_inverted ((read_int ())::a)
    with
        End_of_file -> a
in
    let rec print_list a = match a with
        | []   -> ()
        | e::b -> print_int e; print_newline (); print_list b
    in
        print_list (read_list_inverted [])