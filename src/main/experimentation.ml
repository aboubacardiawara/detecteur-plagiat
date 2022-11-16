open Suffixe_tree
open Lecture_fichier
open Dynamic

(* Write message to file *)
let write_in oc (message:string) =
  Printf.fprintf oc "%s\n" message


let base = "data/donnee"
let ext = ".txt"


let dynamic_solution = 
  Dynamic_algo.solution

let suff_tree_solution =
  sousChainesCommunes

let just size_max text =
  String.sub text 0 size_max

  let extraction file limit = 
    let contain = 
      (let sl = read_base file in
        List.fold_left (^) "" sl) in  (just limit contain)


let exp solveur = 
  let f1 = base ^ "0" ^ ext and f2 = base ^ "0" ^ ext and limit=30 in
    let s1 = (extraction f1 limit) and s2 = (extraction f2 limit) in
      let solution = solveur s1 s2 in 
        print_string solution




let () = exp dynamic_solution; print_string "\n\n"; exp suff_tree_solution

(*let () = 
  let pt1 = Unix.times () in 
    main_c();
    let pt2 = Unix.times () in 
      let ut = pt2.tms_utime -. pt1.tms_utime in
         Printf.printf "user time = %f\n" ut 
*)