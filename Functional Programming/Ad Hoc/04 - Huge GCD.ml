(*gcd = greatest_common_divisor; d = denominator*)

open Big_int

let rec gcd m n = if eq_big_int n zero_big_int
    then m
    else gcd n (mod_big_int m n)

let read_big_int () =
    Str.split (Str.regexp " +") (read_line ())
    |> (List.rev_map big_int_of_string)
    |> (List.fold_left mult_big_int unit_big_int)

let () =
    let d = big_int_of_int 1000000007 in
    let _ = read_line () in
    let m = read_big_int () in
    let _ = read_line () in
    let n = read_big_int () in
    mod_big_int (if compare_big_int m n = 1 then gcd m n else gcd n m) d |> string_of_big_int |> print_string