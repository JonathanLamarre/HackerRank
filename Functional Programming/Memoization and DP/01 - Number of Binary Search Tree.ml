(*ht = hash_table; d = denominator; bi2 = big_int_2; mfact = memoized_fact; a = accumulator; r = result*)
open Big_int

let ht = ref (Hashtbl.create 1000)
let d = big_int_of_int 100000007
let bi2 = big_int_of_int 2

let mfact n =
    let rec f n a = if (n <= 1)
        then a
        else
            try (mult_big_int (Hashtbl.find !ht n) a)
            with Not_found ->
            (
                let r = f (n - 1) (big_int_of_int n) in
                Hashtbl.add !ht n r;
                mult_big_int r a
            )
    in f n unit_big_int

let number_of_bst n =
    mod_big_int (div_big_int (mfact (2 * n)) (mult_big_int (mfact (n + 1)) (mfact n))) d |> string_of_big_int

let () = let rec repeat t = if t = 1
    then print_string (number_of_bst (read_int ()))
    else if (t > 1)
        then
        (
            print_endline (number_of_bst (read_int ()));
            repeat (t - 1)
        )
    in repeat (read_int ())