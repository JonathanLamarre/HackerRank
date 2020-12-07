module Map_of_int = Map.Make (struct type t = int let compare = compare end)

let add k m = Map_of_int.add k ((try Map_of_int.find k m with _ -> 0) + 1) m

let multiply = Map_of_int.merge
    (
        fun _ v1 v2 -> match (v1, v2) with
            | (None, v)
            | (v, None) -> v
            | (Some (v1), Some (v2)) -> Some (v1 + v2)
    )

let lcm = Map_of_int.merge
    (
        fun _ v1 v2 -> match (v1, v2) with
            | (None, v)
            | (v, None) -> v
            | (Some (v1), Some (v2)) -> Some (max v1 v2)
    )

let factorize n =
    let rec f pf m n = match pf with
        | [] -> if n = 1 then m else add n m
        | h::tl -> let r = n mod h = 0 in
            f (if r then pf else tl) (if r then add h m else m) (if r then n / h else n)
    in f [2;3;5;7] Map_of_int.empty n

let value t =
    let bioi = Big_int.big_int_of_int in
    let mpi = Big_int.mult_big_int in
    let pbipi = Big_int.power_big_int_positive_int in
    let r = Map_of_int.fold (fun k v r -> mpi (pbipi (bioi k) v) r) t Big_int.unit_big_int in
    Big_int.mod_big_int r (bioi 1000000007) |> Big_int.int_of_big_int

type tree =
    | Empty
    | Leaf of (int * int Map_of_int.t)
    | Node of (int * tree * int Map_of_int.t * tree * int)

let build_tree list =
    let rec ispow2 x = if x = 2 then true else if x mod 2 <> 0 then false else ispow2 (x / 2) in
    let add t x =
        let x = factorize x in
        let rec f t c = match t with
            | Empty -> Leaf (0, x)
            | Leaf (i, y) as leaf -> c (Node (i, leaf, lcm x y, Leaf (i + 1, x), i + 1))
            | Node (i, lt, y, rt, j) as node -> let j = j + 1 and z = lcm x y in if ispow2 (j - i)
                then c (Node (i, node, z, Leaf (j, x), j))
                else f rt (fun t -> c (Node (i, lt, z, t, j)))
        in f t (fun t -> t)
    in List.fold_left add Empty list

let update t index x =
    let x = factorize x in 
    let rec f t c = match t with
        | Empty -> Empty
        | Leaf (i, y) as leaf-> if index = i then let z = multiply x y in c z (Leaf (i, z)) else c y leaf
        | Node (i, lt, y, rt, j) as node -> if index < i || index > j
            then c y node
            else f lt (fun x lt -> f rt (fun y rt -> let z = lcm x y in c z (Node (i, lt, z, rt, j))))
    in f t (fun _ t -> t)

let query t b e =
    let rec f t c = match t with
        | Empty -> invalid_arg "Empty tree"
        | Leaf (i, x) -> if i >= b && i <= e then c x else c Map_of_int.empty
        | Node (i, lt, x, rt, j) ->
            if i > e || j < b then c Map_of_int.empty
            else if i >= b && j <= e then c x
            else f lt (fun x -> f rt (fun y -> c (lcm x y)))
    in f t (fun r -> r)

let () =
    let _ = read_line () in
    let tree = Str.split (Str.regexp " +") (read_line ())
        |> List.rev_map int_of_string
        |> List.rev
        |> build_tree
    in
    let rec repeat t i = if i > 0 then
    (
        let c, x, y = Scanf.scanf "%c %d %d " (fun c x y -> c, x, y) in
        if c = 'Q' then (query t x y |> value |> string_of_int |> print_endline);
        repeat (if c = 'U' then update t x y else t) (i - 1)
    )
    in Scanf.scanf "%d " (repeat tree)