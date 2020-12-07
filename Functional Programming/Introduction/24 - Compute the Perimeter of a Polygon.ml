let distance (x1, y1) (x2, y2) = sqrt (float ((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)));;

let number_of_point = Scanf.scanf "%d " (fun x -> x) in
let rec repeat n a s =
    if (n = number_of_point)
    then
        (distance (List.hd a) (List.hd (List.rev a))) +. s
    else
        let point = Scanf.scanf "%d %d " (fun x y -> x, y) in
        repeat (n + 1) (point::a) (if n = 0 then s else ((distance point (List.hd a)) +. s))
in
    print_float (repeat 0 [] 0.)