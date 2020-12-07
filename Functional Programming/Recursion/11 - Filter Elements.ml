module MapString = Map.Make(String);;

let list_to_string l = match l with
    | [] -> "-1"
    | _  -> String.concat " " l;;

let filter () =
    let n, k = Scanf.scanf "%d %d " (fun x y -> x, y) in
    let rec f n m i = if (n < 1)
        then
        (
            let bindings = (MapString.bindings (MapString.filter (fun _ (i, c) -> c >= k) m)) in
            list_to_string (List.map (fun (s, _) -> s) (List.sort (fun (_, (i, _)) (_, (j, _)) -> i - j) bindings))
        )
        else
        (
            let s = Scanf.scanf "%s " (fun x -> x) in
            let exists = MapString.mem s m in
            let m = if exists
                then (let (j, c) = MapString.find s m in MapString.add s (j, c + 1) m)
                else (MapString.add s (i, 1) m)
            in f (n-1) m (if exists then i else (i + 1))
        )
    in f n (MapString.empty) 0;;

let rec repeat n = if (n = 1)
    then print_string (filter ())
    else if (n > 1)
        then
        (
            print_endline (filter ());
            repeat (n - 1)
        )
in Scanf.scanf "%d " repeat