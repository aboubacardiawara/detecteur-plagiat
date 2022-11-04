(**
    Implementation of Lexical tree
    Autors: 
    Date:
*)

type noeud_lex = Lettre of char * bool * arbre_lex
and arbre_lex = noeud_lex  list;;
(* PRIMITIVES *)


let existe (m:string) (a:arbre_lex): bool = 
(*teste si un mot appartient à l'arbre*)

let ajoute (m:string) (a:arbre_lex) : arbre_lex =
(*Ajoute un mot à l'arbre et retourne le nouvel arbre*)

let construit (l:string list): arbre_lex =
(*construit un arbre à partir d'une liste de mots*)
    