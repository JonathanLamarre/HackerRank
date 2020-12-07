let is_prime x =
    let x = abs x in
    match x with
        | 2 -> true
        | 0 | 1 -> false
        | _ -> if x mod 2 = 0
        then false
        else
        (
            let limit = int_of_float (sqrt (float_of_int x)) in
            let rec f i = if i > limit
                then true
                else if x mod i = 0 then false else f (i + 2)
            in f 3
        )

let rec is_left s = if s = ""
    then true
    else if s.[0] = '0' || not (is_prime (int_of_string s)) then false
    else is_left (String.sub s 1 ((String.length s) - 1))

let rec is_right s = if s = ""
    then true
    else if s.[0] = '0' || not (is_prime (int_of_string s)) then false
    else is_right (String.sub s 0 ((String.length s) - 1))

let () =
    let rec repeat i = if i > 0 then
    (
        let s = Scanf.sscanf (read_line ()) "%s " (fun i -> i) in
        let is_left = is_left s in
        let is_right = is_right s in
        print_endline
            (if is_left && is_right then "CENTRAL" else if is_left then "LEFT" else if is_right then "RIGHT" else "DEAD");
        repeat (i - 1)
    )
    in repeat (Scanf.sscanf (read_line ()) "%d " (fun i -> i))