let pi = 4. *. atan 1.

let f (a1, a2) x = List.fold_left2 (fun s e1 e2 -> e1 *. (x ** e2) +. s) 0. a1 a2

let integrate ae (lb, ub) add_calculation =
    let rec g x n s = if (n = ((ub - lb) * 1000))
        then s
        else g (x +. 0.001) (n + 1) (0.001 *. (add_calculation ((f ae x))) +. s)
    in g ((float lb) +. 0.0005) 0 0.

let _ =
    let algeabric_expression_1 = List.map float_of_string (Str.split (Str.regexp " +") (read_line ())) in
    let algeabric_expression_2 = List.map float_of_string (Str.split (Str.regexp " +") (read_line ())) in
    let ae = (algeabric_expression_1, algeabric_expression_2) in

    let lower_bound_upper_bound = List.map int_of_string (Str.split (Str.regexp " +") (read_line ())) in
    let lbub = (List.hd lower_bound_upper_bound, List.hd (List.tl lower_bound_upper_bound)) in

    print_float (integrate ae lbub (fun x -> x));
    print_newline ();
    print_float (integrate ae lbub (fun x -> (x ** 2.) *. pi))