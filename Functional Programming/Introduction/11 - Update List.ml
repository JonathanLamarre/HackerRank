let rec abs_list () =
    try
        print_int (abs (read_int ())); print_newline (); abs_list ()
    with
        End_of_file -> ()
in
    abs_list ()