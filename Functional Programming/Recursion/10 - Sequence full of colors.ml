(*c1 = character1; c2 = character2; ls = length_string; r = red; g = green; y = yellow; b = blue*)

let checkColor c1 c2 = if (c1 = c2) then 1 else 0;;

let full_color s =
    let ls = String.length s in
    let rec f i r g y b =
        if (i = ls)
            then (if (r = g && y = b) then "True" else "False")
            else
            (
                if (abs (r - g) > 1 || abs (y - b) > 1)
                    then "False"
                    else
                        let c = s.[i] in
                        f
                           (i + 1)
                           (checkColor c 'R' + r)
                           (checkColor c 'G' + g)
                           (checkColor c 'Y' + y)
                           (checkColor c 'B' + b)
            )
    in f 0 0 0 0 0;;

let rec repeat n = if (n = 1)
    then read_line () |> full_color |> print_string
    else if (n > 1) then (read_line () |> full_color |> print_endline; repeat (n - 1))
in repeat (read_int ())