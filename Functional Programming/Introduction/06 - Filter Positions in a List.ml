let rec filter_even_position x n =
    try
        if (n mod 2 = 0) then (print_int x; print_newline ());
        filter_even_position (read_int ()) (n + 1);
    with 
        End_of_file -> ()
in
    filter_even_position (read_int ()) 1