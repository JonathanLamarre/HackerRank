open String;;

let s1 = read_line () in
let s2 = read_line () in
let rec mingle m a = if m < 0
    then a
    else mingle (m - 1) ((make 1 (s1.[m])) ^ (make 1 (s2.[m])) ^ a)
in mingle ((length s1) - 1) "" |> print_string