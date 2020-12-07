let rotate s =
    let ls = String.length s in
    let rec f n = if (n = ls)
        then
            print_string s
        else
        (
            (String.sub s n (ls - n)) ^ (String.sub s 0 n ) ^ " " |> print_string;
            f (n + 1)
        )
    in f 1;;

let rec repeat m = if (m = 1)
    then
        rotate (read_line ())
    else if (m > 1)
    then 
    (
        rotate (read_line ());
        print_newline ();
        repeat (m - 1)
    )
in repeat (read_int ())