(*Binary tree with first int index of node and second int depth*)
(*t = tree; n,i = index of node; d = depth; l = left tree; r = right tree*)
type tree = Empty | Node of int * int * tree * tree;;

let add t n x y =
    let rec f t = match t with
        | Empty as e -> e
        | Node (i, d, l, r) -> if i = n
            then
            (
                let l = if x = (-1) then Empty else Node (x, d + 1, Empty, Empty) in
                let r = if y = (-1) then Empty else Node (y, d + 1, Empty, Empty) in
                Node (i, d, l, r)
            )
            else Node (i, d, f l, f r)
    in f t;;

let swap t depth =
    let rec f t = match t with
        | Empty as e -> e
        | Node (i, d, l, r) -> if d mod depth = 0
            then Node (i, d, f r, f l)
            else Node (i, d, f l, f r)
    in f t;;

let inorder_traversal t =
    let rec f t = match t with
        | Empty -> ()
        | Node (i, _, l, r) -> (f l; print_int i; print_string " "; f r)
    in f t;;

let number_of_nodes = Scanf.scanf "%d " (fun x -> x) in
let rec repeat t n =
    let t = Scanf.scanf "%d %d " (add t n) in
    if n >= number_of_nodes then t else repeat t (n + 1)
in
let t = repeat (Node (1, 1, Empty, Empty)) 1 in
let rec repeat t n = if (n > 0)
    then
    (
        let t = Scanf.scanf "%d " (swap t) in
        inorder_traversal t;
        print_newline ();
        repeat t (n - 1)
    )
in Scanf.scanf "%d " (repeat t)