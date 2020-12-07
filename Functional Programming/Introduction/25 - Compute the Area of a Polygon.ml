let f (x1, y1) (x2, y2) = x1 * y2 - y1 * x2;;

let number_of_point = Scanf.scanf "%d " (fun x -> x) in
let rec repeat n a s =
    if (n = number_of_point)
    then
        (float (abs (f (List.hd a) (List.hd (List.rev a)) + s))) /. 2.
    else        
        let point = Scanf.scanf "%d %d " (fun x y -> x, y) in
        repeat (n + 1) (point::a) (if n = 0 then s else ((f (List.hd a) point) + s))
in
    print_float (repeat 0 [] 0)