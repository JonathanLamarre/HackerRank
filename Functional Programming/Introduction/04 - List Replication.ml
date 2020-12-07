let rec list_repeat n =
    try
        let rec repeat n x = if (n > 0) then (print_int x; print_newline (); repeat (n - 1) x)
        in
            repeat n (read_int ()); list_repeat n
    with 
        End_of_file -> ()
in
    list_repeat (read_int ())