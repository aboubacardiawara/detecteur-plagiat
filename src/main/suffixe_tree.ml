(**
    Implementation of Lexical tree
    Autors: 
    Date:
*)

type noeud_lex = Lettre of char * bool * arbre_lex
and arbre_lex = noeud_lex  list;;
(* PRIMITIVES *)

let consume s = 
    let a=String.get s 0 and b=String.sub s 1 ((String.length s)-1) in
    (a, b)


(*teste si un mot appartient à l'arbre*)
let rec existe (m:string) (a:arbre_lex): bool = 
    match a, m with
      [], "" -> true
    | [], _ -> false
    | _, "" -> true
    | node::remaining_nodes, m -> match node with
        Lettre (v, bool, tree) -> let c, cs = (consume m) in
          if c=v then existe cs tree
          else existe m remaining_nodes

let () = print_string (if (existe "clefa" [Lettre ('a', false, [Lettre ('n', true, [])]);
Lettre ('b', false,
 [Lettre ('r', false,
   [Lettre ('i', false, [Lettre ('d', false, [Lettre ('e', true, [])])])])]);
Lettre ('c', false,
 [Lettre ('l', false,
   [Lettre ('e', true,
     [Lettre ('f', true, [Lettre ('s', true, [])]); Lettre ('s', true, [])])])]);
Lettre ('d', false, [Lettre ('o', true, [Lettre ('s', true, [])])])]) then ":)" else ":(")