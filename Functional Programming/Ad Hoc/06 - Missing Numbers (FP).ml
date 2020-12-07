module Map_of_int = Map.Make (struct type t = int let compare = compare end)

let plus_one m x = Map_of_int.add x ((try Map_of_int.find x m with _ -> 0) + 1) m
let minus_one m x = Map_of_int.add x ((try Map_of_int.find x m with _ -> 0) - 1) m

let () =
    let rec repeat i f m = if i < 1 then m else repeat (i - 1) f (Scanf.scanf "%d " (f m)) in
    repeat (Scanf.scanf "%d " (fun x -> x)) minus_one Map_of_int.empty
        |> (repeat (Scanf.scanf "%d " (fun x -> x)) plus_one)
        |> Map_of_int.iter (fun x y -> if y > 0 then (print_int x; print_string " "))