let get matrix i j = 
  Array.get (Array.get !matrix i) j

let set matrix i j v = 
  (get matrix i j) := v
  
let row_count matrix = Array.length !matrix

let col_count matrix = Array.length (Array.get !matrix 0)

let from_string s1 s2 = 
let l = ref (
 let n=String.length s1 and m=String.length s2 in 
  Array.make_matrix n m (ref 0)) in l;;  

let max_length matrix =
 let max_size = ref 0 in  
  for i=0 to (row_count matrix-1) do
   for j=0 to (col_count matrix -1) do
    max_size := max !max_size !(get matrix i j);
   done
  done;
  max_size
let value_to_set s1 s2 matrix i j =
  5 (**to do *) 

let fill_first_row s1 s2 matrix = 
  for col=0 to (col_count matrix-1) do
    (get matrix 0 col) := value_to_set s1 s2 matrix 0 col
  done

let fill_first_col s1 s2 matrix = 
  for row=0 to (row_count matrix-1) do
    (get matrix row 0) := value_to_set s1 s2 matrix row 0
  done

let compute_remaining_cell s1 s2 matrix =
    fill_first_row s1 s2 matrix;
    fill_first_col s1 s2 matrix;
    for row=0 to ( String.length s1 -1) do
      for col=0 to (String.length s2 -1) do
        (get matrix row 0) := value_to_set s1 s2 matrix row col
      done
    done

let display matrix = 
  print_string "[";
  for row=0 to (row_count matrix -1 ) do
    print_string "\n[";
    for col=0 to (col_count matrix - 1) do
      print_int !(get matrix row 0);
      print_string " ";
    done;
    print_string "]";
  done;
  print_string "\n]"

let () = let s1="abou" and s2="babacar" in let m=(from_string s1 s2) in compute_remaining_cell s1 s2 m;  display m