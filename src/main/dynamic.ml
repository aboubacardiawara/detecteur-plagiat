module Matrix = struct

    let row_count matrix = Array.length matrix

    let col_count matrix = Array.length (Array.get matrix 0)

    let from_string s1 s2 = 
        let l =
            let n=String.length s1 and m=String.length s2 in 
            Array.init n (fun _ -> Array.init m (fun _ -> 0)) in l;; 

    let create_matrix = from_string
end

module Dynamic_algo = struct
    let value_to_set_basic s1 s2 matrix i j =
        if (String.get s1 i = String.get s2 j) then 
            (if (i=0) || (j=0) then 1
            else matrix.(i-1).(j-1) + 1)
        else 0 

    let value_to_set = value_to_set_basic

    let fill_first_row s1 s2 matrix = 
        for col=0 to (Matrix.col_count matrix-1) do
            matrix.(0).(col) <- (value_to_set s1 s2 matrix 0 col)
        done

    let fill_first_col s1 s2 matrix = 
        for row=0 to (Matrix.row_count matrix-1) do
            matrix.(row).(0) <- (value_to_set s1 s2 matrix row 0)
        done

    let compute_remaining_cell s1 s2 matrix =
        for row=1 to ( String.length s1 -1) do
            for col=1 to (String.length s2 -1) do
                matrix.(row).(col) <- (value_to_set s1 s2 matrix row col)
            done
        done

    let fill_cell s1 s2 matrix =
        fill_first_row s1 s2 matrix;
        fill_first_col s1 s2 matrix;
        compute_remaining_cell s1 s2 matrix

    let display matrix = 
        print_string "[";
        for row=0 to (Matrix.row_count matrix -1 ) do
            print_string "\n[";
            for col=0 to (Matrix.col_count matrix - 1) do
                print_int (matrix.(row).(col));
            print_string " ";
                done;
            print_string "]";
            done;
        print_string "\n]"

    let max_length_bis matrix =
        let max_size = ref 0 and i_end=ref 0 and j_end=ref 0 in  
            for i=0 to (Matrix.row_count matrix-1) do
                for j=0 to (Matrix.col_count matrix -1) do
                    if matrix.(i).(j) > !max_size 
                        then (max_size := matrix.(i).(j); 
                            i_end := i; j_end := j)
                done
            done;
        !i_end-(!max_size)+1, !j_end-(!max_size)+1, !max_size

    let max_length matrix =
        let max_size = ref 0 in  
        for i=0 to (Matrix.row_count matrix-1) do
            for j=0 to (Matrix.col_count matrix -1) do
                max_size := max !max_size matrix.(i).(j);
            done
        done;
            !max_size
    let display_solution triplet =
        let i0, j0, k = triplet in 
        print_string "(";
        print_int i0;
        print_string ", ";
        print_int j0;
        print_string ", ";
        print_int k;
        print_string ")"

    let max_common_sub_str_size s1 s2 =
        let m=(Matrix.create_matrix s1 s2) in 
        fill_cell s1 s2 m;
        max_length_bis m


    let solution s1 s2 = 
        let (i, j, k) = (max_common_sub_str_size s1 s2) in 
        String.sub s1 i k
end

(*
let s1 = "ananasaaa"
let s2 = "nanakkkkk"

let () = print_string (Dynamic_algo.solution s1 s2)*)
(*let () = Dynamic_algo.display_solution (Dynamic_algo.max_common_sub_str_size s1 s2)*)