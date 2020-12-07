(*Formula for n pentagonal number : (3n^2 - n)/2*)
open Big_int

let bioi = big_int_of_int
let mbi = mult_big_int
let dbi = div_big_int
let pipo = power_int_positive_int
let abi = add_big_int

let () = let rec repeat i = if i > 0 then
    let n = read_int () in
    print_endline (dbi ((pipo n 2) |> (mbi (bioi 3)) |> (abi (bioi (-n)))) (bioi 2) |> string_of_big_int);
    repeat (i - 1)
in repeat (read_int ())