(*s = string; lst = list; setos = set_of_string; a = accumulator; cont = continuation; ls = length_of_string; lpass = length_of_pass; b = boolean*)
module Set_of_strings = Set.Make (struct type t = string * string let compare = compare end)

let crack s passes =
    let rec find s lst setos a cont = match s, lst with
        | "", _ -> cont true setos a
		| _, [] -> cont false setos a
        | _, pass::tl ->
            if Set_of_strings.mem (pass, s) setos
                then cont false setos a
                else
                (
                    let ls = String.length s in
                    let lpass = String.length pass in
                    let b = lpass <= ls && (String.sub s 0 lpass) = pass in
                    let s2 = if b then (String.sub s lpass (ls - lpass)) else s in
                    let lst2 = if b then passes else tl in
					let setos2 = if b then setos else Set_of_strings.add (pass, s) setos in
                    let a2 = if b then pass::a else a in
                    let cont2 = if b
                        then
                        (
						    fun b2 setos3 a2 -> if b2
						    then cont true setos3 a2
						    else find s tl (Set_of_strings.add (pass, s) setos3) a cont
                        )
                        else cont
                    in
                    find s2 lst2 setos2 a2 cont2
                )
    in find
        s
        passes
        Set_of_strings.empty
        []
        (fun b _ a -> if b then String.concat " " (List.rev a) else "WRONG PASSWORD")

let () =
    let rec repeat i = if i > 0
        then
        (
            let _ = read_line () in
            let passes = Str.split (Str.regexp " +") (read_line ()) in
            crack (read_line ()) passes |> print_string |> print_newline;
            repeat (i - 1)
        )
    in read_line () |> int_of_string |> repeat