(**
    Implementation of Lexical tree
    Autors: 
    Date:
*)
exception EmptyOption
exception TestFailure

type option = None | Occurences of int*int;;

type noeud_lex = Lettre of string * option * arbre_lex
and arbre_lex = noeud_lex  list;;

(*primitives on option*)
let defaultOption = None

let fst = function 
  None -> raise EmptyOption
  | Occurences (a, _) -> a 

let snd = function
None -> raise EmptyOption
| Occurences (_, b) -> b 

let isEmpty = function
  None -> true
  | _ -> false


(* HELPERS *)
let consumeNextChar s = 
  let a=String.get s 0 and b=String.sub s 1 ((String.length s)-1) in
  (a, b)

let consumeNextStr s = 
  let a=String.sub s 0 1 and b=String.sub s 1 ((String.length s)-1) in 
    (a, b)

let consume = consumeNextStr

let rec substrings (w:string): string list = 
  if w="" then []
  else w :: (let c, cs = consume w in substrings cs)

  (*ajoute un mot a l'arbre*)
let rec sorted_insertion node tree = 
  match node,tree with
    _, [] -> [node]
    | Lettre (v, opt1, _), (Lettre (v', opt2, _) as node')::ns ->
        if v < v' then node :: tree
        else node' :: (sorted_insertion node ns)


(**** 
  PRIMITIVES 
 ***)
let rec size = function 
    [] -> 0
  | Lettre (v, opt, fils) :: ns -> let isTerminal = fun s -> s="#" || s="$" in
      if isTerminal v then 0 + (size ns)
      else 1 + (size fils) + (size ns) 

let rec ajoute(m:string) (a:arbre_lex): arbre_lex =
  match m,a with
    "",_ -> a
    |_, []->let c,cs = consume m in [Lettre (c, defaultOption, ajoute cs [])]
    |_, (Lettre (v, option, fils) as n)::ns -> let c,cs= consume m in
      if c=v then (sorted_insertion (Lettre (v, option, ajoute cs fils)) ns)
      else sorted_insertion n (ajoute m ns)   

(*teste si un mot appartient à l'arbre*)
let rec existe (m:string) (a:arbre_lex): bool = 
  match a,  m with
    [], "" | _, "" | _, "#" -> true
  | [], _ -> false
  | Lettre (v, _, tree)::remaining_nodes, m -> 
      let c, cs = (consume m) in
      if c=v then existe cs tree
      else existe m remaining_nodes
                               
(*contruire un arbre a partir d'un liste de mot*)
let rec construit(l:string list): arbre_lex=
  match l with 
    [] -> [];
  |h::tail-> ajoute h (construit tail)
               
let rec verifie l a = match l with
    [] -> []
  | x::xs -> if existe x a then verifie xs a else x :: (verifie xs a)

(*Question 3.9*)
let arbreSuffixes = fun w -> construit (substrings w) 

(*is w2 substring of w1 ?*)
let sousChaine w1 w2 = existe w2 (arbreSuffixes w1)

let rec for_each_node tree f = match tree with
  [] -> true
  |(Lettre (v, option, sub) as x)::xs -> (f x) && (for_each_node sub f) && (for_each_node xs f)  

let selecte_longest (tree:arbre_lex): = __
let counter (tree:arbre_lex):arbre_lex= __

let sousChainesCommunes s1 s2 =
  let tree=(arbreSuffixes (s1^"#")) in 
    let tree' = ajoute (s2 ^"$") tree in
      selecte_longest (counter tree')




(**
 TESTS 
*)
let treeExample = arbreSuffixes "ananans#banane$"

let rec all_couple_are_sousChaine = function
    [] -> true
    | (w1, w2)::examples -> sousChaine w1 w2 && (all_couple_are_sousChaine examples)
    
let testSousChaine = 
  let l = [("ananas#", "anas"); ("ananas#", "anas#"); ("ananas#", "#"); ("ananas#", "anas")]
  and l' = [("anas", "ane"); ("hello world", "ello wolrd")] in
  all_couple_are_sousChaine l && (not (all_couple_are_sousChaine l'))


let get_node_option = function
  Lettre (v, option, _) -> option

let testNodesOptionAreInitiallyEmpty =
  let tree = treeExample in 
    for_each_node tree (fun node -> 
      if (get_node_option node) = None then true
      else false)


let () =  if testNodesOptionAreInitiallyEmpty then print_string ":)" else print_string ":("