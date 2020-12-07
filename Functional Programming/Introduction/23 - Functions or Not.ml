let read_int () = Scanf.scanf "%d " (fun x -> x)

let is_function number_of_pair =
    let rec f n a result = if (n < number_of_pair)
        then
        (
            let p = Scanf.scanf "%d %d " (fun x y -> x,y) in
            let result = result && (not (List.exists (fun e -> (fst e = fst p) && (snd e <> snd p)) a)) in
            f (n + 1) (p::a) result
        )
        else
            result
    in f 0 [] true

let _ =
    let number_of_test_case = read_int () in
    let rec repeat n =
        if (n < number_of_test_case)
        then
        (
            if (is_function (read_int ())) then (print_string "YES\n") else (print_string "NO\n");
            repeat (n + 1)
        )
    in repeat 0