exception TestFailure of string

let assert' desc assertion = 
  if not assertion then raise (TestFailure desc);;

let deny desc assertion = assert' desc (not assertion);; 


let assert_equals desc a b = 
  if not (a=b) then raise (TestFailure desc);;

let deny_equals desc a b =
  if a=b then raise (TestFailure desc);;