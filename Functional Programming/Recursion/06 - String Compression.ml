let compress s =
    let ls = String.length s in
    let rec f i j =
        if (j = ls || s.[i] <> s.[j]) then (print_char (s.[i]); if (j - i > 1) then print_int (j - i));
        if (j < ls) then f (if (s.[i] = s.[j]) then i else j) (if (s.[i] = s.[j]) then (j + 1) else j)
    in f 0 0
in compress (read_line ())