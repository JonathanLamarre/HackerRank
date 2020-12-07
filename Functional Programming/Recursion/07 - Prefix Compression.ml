let s1 = read_line () in
let s2 = read_line () in
let ls1 = String.length s1 in
let ls2 = String.length s2 in
let rec compress i = if (i = ls1 || i = ls2 || s1.[i] <> s2.[i])
    then
    (
        string_of_int i         ^ " " ^ String.sub s1 0 i         ^ "\n" |> print_string;
        string_of_int (ls1 - i) ^ " " ^ String.sub s1 i (ls1 - i) ^ "\n" |> print_string;
        string_of_int (ls2 - i) ^ " " ^ String.sub s2 i (ls2 - i)        |> print_string
    )
    else
        compress (i + 1)
in compress 0