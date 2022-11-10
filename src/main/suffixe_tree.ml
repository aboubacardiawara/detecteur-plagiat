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

let rec substrings (w:string): string list = 
  if w="" then []
  else w :: (let c, cs = consume w in substrings cs)
(*teste si un mot appartient à l'arbre*)
let rec existe (m:string) (a:arbre_lex): bool = 
  match a, m with
    [], "" -> true
  | [], _ -> false
  | _, "" -> true
  | Lettre (v, bool, tree)::remaining_nodes, m -> 
      let c, cs = (consume m) in
      if c=v then existe cs tree
      else existe m remaining_nodes

(*ajoute un mot a l'arbre*)
let rec sorted_insertion node tree = 
  match node,tree with
    _, [] -> [node]
    | Lettre (v, b, _), (Lettre (v', _, _) as node')::ns ->
        if v < v' then node :: tree
        else node' :: (sorted_insertion node ns)
  
let rec ajoute(m:string) (a:arbre_lex): arbre_lex =
  match m,a with
    "",_ -> a
    |_, []->let c,cs = consume m in [Lettre (c,(cs=""),ajoute cs [])]
    |_, (Lettre (v, b, fils) as n)::ns -> let c,cs= consume m in
      if c=v then (sorted_insertion (Lettre (v, (cs=""), ajoute cs fils)) ns)
      else sorted_insertion n (ajoute m ns)        
                               
(*contruire un arbre a partir d'un liste de mot*)
let rec construit(l:string list): arbre_lex=
  match rev l with 
    [] -> [];
  |h::tail-> ajoute h (construit tail)
               
let rec verifie l a = match l with
    [] -> []
  | x::xs -> if existe x a then verifie xs a else x :: (verifie xs a)


    
(**Exporte dans un fichier un arbre lexical*)
(*let to_file (lexical_tree:arbre_lex) (file_name: lexical_tree) :unit() =        *)

let () =  construit  (substrings "ananas"); ()