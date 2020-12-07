let rec f x = match x with
    | 0 -> ()
    | _ -> print_string ("Hello World\n"); f (x - 1)
in f (read_int ())