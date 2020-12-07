let fibonacci n =
    let rec f m a b = if (m = n)
        then a
        else f (m + 1) b (a + b)
    in f 1 0 1
in print_int (Scanf.scanf "%d" fibonacci)