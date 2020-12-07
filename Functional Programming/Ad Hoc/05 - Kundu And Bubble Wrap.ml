let () =
    let n = Scanf.scanf "%d %d " (fun x y -> x * y) in
    let nf = float_of_int n in
    let rec f i a = match i with
        | 0 -> a
        | _ -> f (i - 1) (nf /. (float_of_int i) +. a)
    in print_float (f n 0.0)