(*Leftist heap*)
module Heap = struct
    module type OrderedType = sig
        type t
        val compare : t -> t -> int
    end
    
    module Make(Ord : OrderedType) = struct
        type element = Ord.t
    
        type heap =
            | Empty
            | Node of (heap * int * element * int * heap)

        let empty = Empty

        let size h = match h with
            | Empty -> 0
            | Node (_, _, _, s, _) -> s

        let merge h1 h2 =
            let rank h = match h with
                | Empty -> 0
                | Node (_, r, _, _, _) -> r
            in
            let rec f h1 h2 c = match h1, h2 with
                | Empty, h
                | h, Empty -> c h
                | Node (lh, r, v1, _, rh), Node (_, _, v2, _, _) ->
                    let swap = Ord.compare v1 v2 > 0 in
                    let h3, h4 = if swap then h2, h1 else rh, h2 in
                    let c2 = fun h -> c
                    (
                        if (rank lh > rank h)
                        then Node (lh, rank h + 1, v1, (size lh) + (size h) + 1, h)
                        else Node (h, rank lh + 1, v1, (size lh) + (size h) + 1, lh)
                    ) in
                    f h3 h4 (if swap then c else c2)
            in f h1 h2 (fun h -> h)

        let add x h = merge h (Node (Empty, 1, x, 1, Empty))

        let peek h = match h with
            | Empty -> invalid_arg "Empty heap"
            | Node (_, _, v, _, _) -> v

        let pop h = match h with
            | Empty -> invalid_arg "Empty heap"
            | Node (lh, _, _, _, rh) -> merge lh rh
    end
end

module Heap_max = Heap.Make (struct type t = int let compare = fun x y -> y - x end)
module Heap_min = Heap.Make (struct type t = int let compare = fun x y -> x - y end)
module Map_of_int = Map.Make (struct type t = int let compare = compare end)

let insert (h_max, h_min) z = if Heap_max.size h_max = 0
    then (Heap_max.add z h_max, h_min)
    else
    (
        let h_max = if z < (Heap_max.peek h_max) then Heap_max.add z h_max else h_max in
        let h_min = if z < (Heap_max.peek h_max) then h_min else Heap_min.add z h_min in
        if (Heap_min.size h_min) > (Heap_max.size h_max)
            then (Heap_max.add (Heap_min.peek h_min) h_max, Heap_min.pop h_min)
            else if (Heap_max.size h_max) - (Heap_min.size h_min) > 1
            then (Heap_max.pop h_max, Heap_min.add (Heap_max.peek h_max) h_min)
            else (h_max, h_min)
    )

let () =
    let limit = Scanf.sscanf (read_line ()) "%d " (fun x -> x) in
    let rec repeat a median i = if limit - i > 0 then
    (
       let n = Scanf.sscanf (read_line ()) "%d " (fun x -> x) in
       let median = if n < 0 then Map_of_int.find (i + n) a else insert median n in
       print_endline (string_of_int (Heap_max.peek (match median with h_max, _ -> h_max)));
       repeat (Map_of_int.add i median a) median (i + 1)
    )
    in repeat Map_of_int.empty (Heap_max.empty, Heap_min.empty) 0