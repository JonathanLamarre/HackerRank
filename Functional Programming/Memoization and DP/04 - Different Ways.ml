(*mfact = memoized_factorial; c = continuation; r = result; ht = hash_table; d = denominator;*)

open Big_int
open Hashtbl

let mfact n ht =
    let rec f n c = match n with
        | 0 | 1 -> c unit_big_int
        | _ ->
            try c (find ht n)
            with
                | Not_found -> f (n - 1) (fun x -> let r = mult_big_int x (big_int_of_int n) in add ht n r; c r)
    in f n (fun x -> x)

let () =
    let ht = create 1000 in
    let d = big_int_of_int 100000007 in
    let modbi = mod_big_int in
    let dbi = div_big_int in
    let mbi = mult_big_int in
    let rec repeat i = if i > 0 then
        let n, k = Scanf.scanf "%d %d " (fun x y -> x, y) in
        modbi (dbi (mfact n ht) (mbi (mfact k ht ) (mfact (n - k) ht))) d |> string_of_big_int |> print_endline;
        repeat (i - 1)
    in repeat (read_int ())