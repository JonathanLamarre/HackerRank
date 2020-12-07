let s = read_line () in
let ls = String.length s in
let rec remove_duplicate n a = if (n < ls) then
    let c = s.[n] in
    remove_duplicate (n + 1) (if List.mem c a then a else (print_char c; c::a))
in remove_duplicate 0 []