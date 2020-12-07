let rec gcd m n = match n with
    | 0 -> m
    | _ -> gcd n (m mod n)

let find_number_of_prime_factor n =
    let root = float n |> sqrt |> int_of_float in
    let true_root = root * root = n in
    let rec f i a = match i with
       | 0 -> a
       | _ -> f (i - 1) (if n mod i = 0 then a + 2 else a)
    in f (if true_root then root - 1 else root) (if true_root then 1 else 0)

let () =
    let rec repeat i = if i > 0 then
    (
       Scanf.scanf "%d %d " (fun x y -> if x > y then gcd x y else gcd y x)
           |> find_number_of_prime_factor
           |> string_of_int
           |> print_endline;
       repeat (i - 1)
    )
    in Scanf.scanf "%d " repeat