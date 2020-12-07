let rec length_of_input l =
    try
        let _ = read_int () in
        length_of_input (l + 1)
    with
        End_of_file -> l
in
    print_int (length_of_input 0)