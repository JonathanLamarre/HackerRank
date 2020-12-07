module Map_of_int = Map.Make (struct type t = int let compare = compare end)
module Map_of_dice = Map.Make (struct type t = int * int * int * int * int * int let compare = compare end)

(*A dice a is tuple of int of the form: (top, bottom, left, right, front, back)*)
let initial_dice = (1, 6, 3, 4, 2, 5)
let rotate_right dice  = match dice with t, bo, l, r, f, ba -> (l, r, bo, t, f, ba), l
let rotate_down dice = match dice with t, bo, l, r, f, ba -> (ba, f, l, r, t, bo), ba

(*Structure of the grid, i are rows, j are columns, each case contains a map of dices configuration*)
let find i j m =
    let (m1, m2) = try (m, Map_of_int.find i m) with
        | Not_found -> (Map_of_int.add i Map_of_int.empty m, Map_of_int.empty)
    in
    try (m1, m2, Map_of_int.find j m2) with
        | Not_found ->
            let m2 = Map_of_int.add j Map_of_dice.empty m2 in
            (Map_of_int.add i m2 m1, m2, Map_of_dice.empty)

(*Function to merge the dices configuration of a case created from upper and left cases in the grid*)
let merge_map_dice upper left = if Map_of_dice.is_empty upper && Map_of_dice.is_empty left
    then match initial_dice with top, _, _, _, _, _ -> Map_of_dice.add initial_dice top Map_of_dice.empty
    else
    (
        Map_of_dice.merge
            (
                fun dice option_1 option_2 -> match (option_1, option_2) with
                    | (None, (Some (_) as option_2)) -> option_2
                    | ((Some (_) as option_1), None) -> option_1
                    | (Some (v1), Some (v2)) -> Some (max v1 v2)
                    | (_,_) -> invalid_arg "No dice"
            )
            (
                Map_of_dice.fold
                    (fun dice v m -> let dice, t = rotate_down dice in Map_of_dice.add dice (v + t) m)
                    upper
                    Map_of_dice.empty
            )
            (
            Map_of_dice.fold
                (fun dice v m -> let dice, t = rotate_right dice in Map_of_dice.add dice (v + t) m)
                left
                Map_of_dice.empty
            )
    )

(*Function to find the max value of a map of dices configuration. m = map; v1 = v2 = value*)
let find_max_path_value m = Map_of_dice.fold (fun _ v1 v2 -> max v1 v2) m min_int

(*Function to compute the grid. i = row; j = column; m = map; md1 = md2 = map_of_dice*)
let compute_grid number_of_rows number_of_columns =
    let rec repeat1 i m = if i > number_of_rows
        then m
        else 
        (
            let rec repeat2 j m = if j > number_of_columns
            then m
            else
            (
                let m, _, md1 = find (i - 1) j m in
                let m, mi, md2 = find i (j - 1) m in
                repeat2 (j + 1) (Map_of_int.add i (Map_of_int.add j (merge_map_dice md1 md2) mi) m)
            )
            in repeat1 (i + 1) (repeat2 1 m)
        )
    in repeat1 1 Map_of_int.empty

let () =
    let m = compute_grid 60 60 in
    let rec repeat i = if i > 0
        then
            let (x, y) = Scanf.scanf "%d %d " (fun x y -> (x, y)) in
            let _, _, map_dice = find x y m in
            find_max_path_value map_dice |> print_int |> print_newline;
            repeat (i - 1)
    in Scanf.scanf "%d " repeat