let gcd l1 l2 =
    let rec f l1 l2 a = match l1,l2 with
        | [], _ | _, [] -> List.rev a
        | p1::n1::t1, p2::n2::t2 ->
            f (if p1 <= p2 then t1 else l1) (if p1 >= p2 then t2 else l2) (if p1 = p2 then min n1 n2::p1::a else a)
        | _ -> invalid_arg "Odd number of elements in list"
    in f l1 l2 []

let () = let rec repeat n a = if n < 1
    then List.iter (fun x -> print_int x; print_string " ") (List.fold_left gcd (List.hd a) (List.tl a))
    else repeat (n - 1) ((List.rev (List.rev_map int_of_string (Str.split (Str.regexp " +") (read_line ()))))::a)
in repeat (int_of_string (read_line ())) []