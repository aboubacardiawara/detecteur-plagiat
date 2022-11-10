(*** compilation :

   ocamlc unix.cma -o lecture_fichier.byt lecture_fichier.ml
   ocamlopt  unix.cmxa -o lecture_fichier.nat lecture_fichier.ml

   
   usage :

     ./lecture_fichier.nat fichier
     ./lecture_fichier.byt fichier
   
 ***)

 let read_base name_file =
  let channel = open_in name_file in
  let rec read_file () = 
    try 
      let data =  (input_line channel ) in
        data :: (read_file ())
    with End_of_file ->  close_in channel ; []
  in
    List.rev (read_file()) ;;

let main_c () = 
 let file =
   if Array.length Sys.argv >= 2 then Sys.argv.(1)
   else failwith "No filename"
 in
   Printf.printf "fichier : %s\n\n" file ;
   let sl = read_base file in
     List.iter (Printf.printf "--> %s\n\n") sl ;
     let s = List.fold_left (^) "" sl in
       Printf.printf ("--> %s\n\n") s ;
       let uS = String.map Char.uppercase_ascii s in
         Printf.printf "--> %s\n\n" uS ;
         Printf.printf "-->" ;
         String.iter (fun x -> Printf.printf "%d " (Char.code x)) s ;
         Printf.printf("\n\n")

;;

let main () = 
 let pt1 = Unix.times () in 
   main_c();
   let pt2 = Unix.times () in 
     let ut = pt2.tms_utime -. pt1.tms_utime in
        Printf.printf "user time = %f\n" ut 
;;

main() ;;