let rec gcd m n = match n with
    | 0 -> m
    | _ -> gcd n (m mod n)
in print_int (Scanf.scanf "%d %d " gcd)