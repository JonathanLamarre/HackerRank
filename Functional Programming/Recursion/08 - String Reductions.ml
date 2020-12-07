let reduce s =
    let ls = String.length s in
    let rec f i a = if (i = ls)
        then List.fold_right (fun c s -> s ^ (String.make 1 c)) a ""
        else f (i + 1) (if (List.mem s.[i] a) then a else (s.[i])::a)
    in f 0 []
in read_line () |> reduce |> print_string