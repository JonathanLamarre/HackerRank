(*Red black binary search tree for pair of value and position*)
type color = Red | Black;;
type tree = Empty | Node of (int * int) * tree * tree * color;;

let add t (x, y) =
    let makeBlack t = match t with
        | Empty -> Empty
        | Node (v, l, r, _) -> Node (v, l, r, Black)
    in
    let rotate x y z a b c d = Node (y, Node (x, a, b, Black), Node (z, c, d, Black), Red) in
    let balance t = match t with
        | Node (z, Node (y, Node (x, a, b, Red), c, Red), d, Black)
        | Node (z, Node (x, a, Node (y, b, c, Red), Red), d, Black)
        | Node (x, a, Node (z, Node (y, b, c, Red), d, Red), Black)
        | Node (x, a, Node (y, b, Node (z, c, d, Red), Red), Black) -> rotate x y z a b c d
        | _ -> t
    in
    let rec walk t = match t with
        | Empty -> Node ((x, y), Empty, Empty, Red)
        | Node ((v, n), l, r, c) -> if x = v
            then t
            else (let xgv = x > v in balance (Node ((v, n), (if xgv then l else walk l), (if xgv then walk r else r), c)))
    in makeBlack (walk (t));;

(*Construction of the tree*)
let _ = read_line ();;
let lst = List.sort (fun x y -> y - x) (List.map int_of_string (Str.split (Str.regexp " +") (read_line ())));;
let t = match (List.fold_left (fun (x, y, t) z -> (x + 1, y + z, add t (y + z, x + 1))) (0, 0, Empty) lst) with | (_, _, t) -> t;;

(*Ad hoc research*)
let find_smallest_greater_or_equal x =
    let rec f t a = match t with
        | Empty -> a
        | Node ((v, n), l, r, _) -> f (if v >= x then l else r) (if v >= x then n else a)
    in string_of_int (f t (-1));;

let rec repeat n = if (n = 1)
    then print_string (find_smallest_greater_or_equal (read_int ()))
    else if (n > 1) then
    (
        print_endline (find_smallest_greater_or_equal (read_int ()));
        repeat (n - 1)
    )
in repeat (read_int ())