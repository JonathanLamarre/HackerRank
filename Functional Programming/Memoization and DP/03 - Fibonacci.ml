(*ht = hash_table; c = continuation; r = result; d = denominator*)

open Big_int
open Hashtbl

let fibonacci n ht =
    let rec f n c = match n with
        | 0 -> zero_big_int
        | 1 -> c unit_big_int
        | _ -> try c (find ht n) with
            | Not_found -> f (n - 1) (fun x -> let r = add_big_int x (f (n - 2) (fun x -> x)) in add ht n r; c r)
    in f n (fun x -> x)

let () =
    let ht = create 1000 in
    let d = big_int_of_int 100000007 in
    let rec repeat i = if i > 0
        then
        (
            mod_big_int (fibonacci (read_int ()) ht) d |> string_of_big_int |> print_endline;
            repeat (i - 1)
        )
    in repeat (read_int ())