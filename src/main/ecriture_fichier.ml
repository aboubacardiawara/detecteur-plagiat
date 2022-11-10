(* Write message to file *)
let write_in oc (message:string) =
  Printf.fprintf oc "%s\n" message

let () =
  let oc=open_out "foo" and msg="hello world again" in
    write_in oc msg;
    close_out oc;