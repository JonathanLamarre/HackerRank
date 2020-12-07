let compute_ex x =
    let rec f powx fact n s = match n with
        | 11 -> s
        | _  -> f (powx *. x) (fact * n) (n + 1) (s +. (powx /. float_of_int fact))
    in
        f 1. 1 1 0.
in

let rec repeat n =
    if (n > 0) then (print_float (compute_ex (read_float ())); print_newline (); repeat (n - 1))
in
    repeat (read_int ())