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


let exp solveur id1 id2 size = 
  let f1 = base ^ id1 ^ ext and f2 = base ^ id2 ^ ext and limit=size in
    let s1 = (extraction f1 limit) and s2 = (extraction f2 limit) in
      let pt0 = Unix.times () in
        let _ = solveur s1 s2 in
          let pt1 = Unix.times () in
            pt1.tms_utime -. pt0.tms_utime

let ids = ["0"; "1"; "2"; "3"; "4"; "5"; "6"]

let average_duration_exp solveur size = 
  let duration_sum = ref 0.0 in
  for i=0 to (List.length ids - 1) do
    for j=0 to (List.length ids - 1) do
      if j != i then
        (
          let id0 = List.nth ids i and id1 = List.nth ids j in
          duration_sum := !duration_sum +. (exp solveur id0 id1 size) 
        ) 
    done
  done;
  !duration_sum /. 7.0
  
let rec one_to n = 
  match n with
  0 -> []
  | _ -> (one_to (n-1)) @ [n]

let multipleExp =
  let sizes = one_to 200 in
  for i=0 to (List.length sizes-1) do
    let size= List.nth sizes i in
    let average_duration = average_duration_exp dynamic_solution size in
      Printf.printf "%d %f\n" size average_duration
  done 


let () = multipleExp

(*let () = 
  let pt1 = Unix.times () in 
    main_c();
    let pt2 = Unix.times () in 
      let ut = pt2.tms_utime -. pt1.tms_utime in
         Printf.printf "user time = %f\n" ut 
*)