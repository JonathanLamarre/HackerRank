open Big_int

let lcm m n = div_big_int (mult_big_int m n) (gcd_big_int m n)

let () =
    let _ = read_line () in
    let lst = List.map big_int_of_string (Str.split (Str.regexp " +") (read_line ())) in
    (List.fold_left lcm (List.hd lst) (List.tl lst)) |> string_of_big_int |> print_string