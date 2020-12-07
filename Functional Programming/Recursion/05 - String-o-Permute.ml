let permute s =
    let rec f n = if (n < (String.length s))
        then
        (
            print_char s.[n + 1];
            print_char s.[n];
            f (n + 2);
        )
    in f 0;;

let rec repeat n = if (n = 1)
    then
        permute (read_line ())
    else if (n > 1)
    then
    (
        permute (read_line ());
        print_newline ();
        repeat (n - 1)
    )
in repeat (read_int ())