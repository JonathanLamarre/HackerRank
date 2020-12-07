let rec filter_list x =
    try
        let b = (read_int ()) in
        if (b < x) then (print_int b; print_newline ());
        filter_list x
    with 
        End_of_file -> ()
in
    filter_list(read_int ())