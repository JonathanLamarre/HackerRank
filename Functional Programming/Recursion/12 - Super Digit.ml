open Big_int;;

let super_digit bi =
    if (compare_big_int bi zero_big_int = 0)
    then zero_big_int
    else
    (
        let bi9 = big_int_of_int 9 in
        let r = mod_big_int bi bi9 in
        if (compare_big_int r zero_big_int = 0) then bi9 else r
    );;

let bi1, bi2 = Scanf.scanf "%s %s " (fun x y -> big_int_of_string x, big_int_of_string y) in
super_digit bi1 |> mult_big_int bi2 |> super_digit |> string_of_big_int |> print_string