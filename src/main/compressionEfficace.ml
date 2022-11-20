  type noeud_lex = Lettre of string * arbre_lex
  and arbre_lex = noeud_lex  list;;



  let consume s =
  let a=String.sub s 0 1 and b=String.sub s 1 ((String.length s)-1) in 
      (a, b);;
  let premierLettre s=  let a=String.sub s 0 1 in a;;

  let concat (n:string) (a:arbre_lex):arbre_lex=
    match a,n with
      [],n -> [Lettre(n,[])]
      |Lettre(v1,tree1)::reste,n -> Lettre(n^v1,tree1)::reste;;

  let rec substrings (w:string): string list = 
      if w="" then []
      else w :: (let c, cs = consume w in substrings cs);;

  (*Compression efficace de l'arbre: AbresufixeCompresse*)
  let rec ajouteSuffixe(s:string) (a:arbre_lex):arbre_lex=
  match a,s with
  [],""->[]
  |[],s1 -> [Lettre(s1,[])]
  |Lettre(v,tree)::reste,_ -> if (String.length v)=1 then 
                                    let c,cs=consume s in 
                                      (if c=v then  Lettre(v,ajouteSuffixe cs tree)::reste
                                        else Lettre(v,tree):: ajouteSuffixe s reste)
                              else
                                (let c,cs=consume v and c',cs'=consume s in 
                                    if c=c' then (let a=premierLettre cs and a'=premierLettre cs' in 
                                    (if a=a' then concat c (ajouteSuffixe cs' [Lettre(cs,[])]) @ reste
                                    else  Lettre(c,[Lettre(cs,tree);Lettre(cs',[])])::reste))
                                      else Lettre(v,tree):: ajouteSuffixe s reste);;
                                    
                                  
  let rec compression (l:string list):arbre_lex=
        match l with 
          []->[]
          |t::h-> ajouteSuffixe t (compression h)


let s= substrings "ANANAS#";;


  (*Test compression Efficace*)
  let a=compression s;;
