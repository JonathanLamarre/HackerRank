(*a = accumulator; m, m1, m2 = map; p = power; v, v1, v2 = value*)

module Map_of_int = Map.Make (struct type t = int let compare = compare end)

let power x n =
    let rec f n a = match n with
        | 0 -> a
        | _ -> f (n - 1) (x * a)
    in f n 1

let find i j m =
    let (m1, m2) = try (m, Map_of_int.find i m) with
        | Not_found -> (Map_of_int.add i Map_of_int.empty m, Map_of_int.empty)
    in
    try (m1, m2, Map_of_int.find j m2) with
        | Not_found -> let m2 = Map_of_int.add j 0 m2 in (Map_of_int.add i m2 m1, m2, 0)

let () =
    let size, exponent = Scanf.scanf "%d %d " (fun x y -> x, y) in
    let rec repeat1 i m a = 
        let p = power i exponent in
        if p > size
            then (let _, _, v = find (i - 1) size m in v)
            else 
            (
                let a = a + p in
                let rec repeat2 j m = if j > a || j > size
                    then m
                    else
                    (
                        let m, _, v1 = find (i - 1) j m in
                        let m, m2, _ = find i (j - 1) m in
                        let v =
                            if p > j then v1
                            else if p = j then (v1 + 1)
                            else (let _, _, v2 = find (i - 1) (j - p) m in v1 + v2)
                        in
                        repeat2 (j + 1) (Map_of_int.add i (Map_of_int.add j v m2) m)
                    )
                in repeat1 (i + 1) (repeat2 (if power (i + 1) exponent > size then size else 1) m) a
            )
    in print_int (repeat1 1 Map_of_int.empty 0)