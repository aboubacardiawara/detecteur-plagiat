# Detecteur de plagiat

# Auteurs:
- todo
- todo

# 2. Programmation dynamique
## 2.1 Sous structure optimale.
### 2.1.1 Quelques exemples
Exemple1: Soit deux chaines C1 et C2 respectivement egale à ANANAS et BANANE.
La plus longue sous chaine commune est: ANAN.
*[ANAN]AS et B[ANAN]E*

Exemple2: Soit deux chaines C1 et C2 respectivement egale à FOO et TIMOLEON.
La plus longue sous chaine commune est: O.
*F[O]O et TIM[O]LEON*

### 2.1.2 Determination de la sous structure optimale
$L(i, j) :$ la longueur de la + longue sous-chaîne s’arrêtant en $xi$ et $yj$ .

## 2.2 Deduction de la longueur.
La longueur $L$ de la plus grande sous chaine commune  correspondra à la valeur maximale parmi les longueurs calculées pour tout i et j.
$$L = \max_{(i, j)} (L(i, j))$$
## 2.3 Equation associée à la sous structure optimale.
Soit deux chaines:
 $$S1 = x_1 x_2 x_3....x_n$$
 $$S2 = y_1 y_2 y_3....y_m$$

On veut determiner la longueur de la plus longue chaine S':
$$S'=x_i, x_{i+1}x_{i+2}...x_{i+k-1}=y_j, y_{j+1}y_{j+2}...x_{j+k-1}$$


$$ L(i, j)=\left\{
\begin{array}{ll}
 1 + L(i-1, j-1) & {si} & x_i = y_j \\
 0 & sinon
\end{array}
\right. $$

## 2.4 Enrichissement. Determination de la position d'une des sous chaines.
On peut utiliser une variable qui stocke les coordonnées $(i, j)$ du maximum local.
A la fin de l'execution, les positions $(i, j)$ representent la position finale de la
plus longue sous chaine commune dans $S1$ et $S2$. La deduction du debut dans les deux chaines
est alors triviale connaissant sa longueur.
Notre algorithme renverra un triplet de la forme $(i0, j0, k)$ où k est la taille de la sous chaine.
## 2.5 Analyse de la complexité.
Soit $n$ et $m$ les tailles respectives des chaines de caractères $S_1$ et $S_2$.
L'analyse de la compléxité porte sur le nombre d'addition effectuée dans le pire cas.

### 2.5.1 Pire cas
*Le pire cas* correspond au cas où les deux chaines utilisent le même caractère. \
Exemple:
- $S_1$  = $aaaaaaa$
- $S_2$  = $aaaa$

On effectuera n*m addition.   
$aaaa$ est la plus longue sous chaine commune et elle correspond à la chaine $S_2$.

### 2.5.2 Meilleur cas
*Le meilleur cas* correspond au cas où les deux chaines contiennent des ensembles de caractère disjoints.
Exemple:
- $S_1$  = $abcdef$
- $S_2$  = $ghijk$

On effectuera 0 additon.
Globalement la compléxité de cette approche en nombre d'addition est $O(m*n)$ avec m et n les tailles des chaines.
## Etapes d'implementation
- [x] Terminé totalement
- [ ] Jeu de tests valides


# 3. Arbre de suffixes
## 3.7 Comment savoir si une chaine C2 est une sous chaine d'une chaine C1 (arbre de suffixe).
Un parcours de l'arbre nous le permet. On prend le caractère $c_i$ à la tête de C2,
le noeud à explorer dans l'arbre correspond à celui parmi les enfants qui porte l'etiquette $c_i$.
On continue de façon recursive jusqu'à consommer la totalité de la chiane.
Sinon on arrive pas (aucun fils ne portant l'etiquette de la tête de la chaine à consommer), alors on peut conclure que C2   
n'est pas une sous chaine de C1.
## 3.8 Définir une structure de données et les primitives permettant de manipuler les arbres des suffixes
```ocaaml
type noeud_lex = Lettre of char * arbre_lex
and arbre_lex = noeud_lex list;;

```

## 3.9 Definition de la fonction de construction de l'arbre des suffixes 
```ocaml
val: arbreSuffixes (string) -> arbre_suffixes
```
## 3.10 Predicat pour verifier qu'une chaine est une sous-chaine de l'autre 
```ocaml
val: sousChaine (string) (string) -> bool
```
## 3.11 Jeu de tests
## 3.12 Analyse de la complexité (en temps, en espaces)
### 3.12.1 Complexite construction de l'arbre
La musure de complexite porte sur le nombre insertion au pire cas
Soient $n$ : la taille de la chaine 
NB: Le pire cas correspond au cas ou il n'y a pas deux suffixe qui commencent par la meme lettre 
L'algorithme fonctionne comme tel: au debut on insere le premier suffixe(taille n) dans une liste qui est vide donc 0 comparaison mais comme on insere caractere par caractere on aura $n$ insertion

Puis on prend le deuxieme suffixe et on l'insere dans l'arbre qui contient le premier.L'insertion se fait caractere par caractere en faisant en premier lieu la comparaison du caractere avec le noeud courant puis ce qu'il n'y pas deux suffixe qui debute par la meme lettre on fera juste 1 comparaison et $(n+1)$ insertion vu que reste de la liste est vide

Cela va continuer ainsi:
$suff3$: 2 comparaison et n-1 insertion
.
.
.
$suff0$: n comparaison et 1 insertion

Au final, om a :
    $$T = $n$ + $(n-1)$+....+1= $O(n)$ (Temporelle)

A chaque etape l'algorithme stock en $c$ et $cs$ qui ont un coup que l'on fixe a constante $cst$ donc au pire cas $(n*cst)$ -> $O(n)$ en espace

## 3.12.1 Existance de souc-Chaine
La musure de complexite porte sur le nombre de comparaison au pire cas
NB:le pire cas correspont au cas ou la chaine se trouve au dernier noeud fils de la racine

soit $n$ : La taile de la sous chaine
soit $a$ : La cardinal de l'alphabet de l'arbre

L'algorithme fait une comparaison caractere par caractere si y'a egalite il entre en profondeur sinon il continu de chercher dans l'autre partie de l'arbre. Dans ce cas on aura: $$T = $n$ + $a$ = $O(n)$ (Temporelle)

A chaque comparaison l'algorithme stock en $c$ et $cs$ qui ont un coup que l'on fixe a constante $cst$ donc au pire cas $(n*cst)$ -> $O(n)$ en espace

## 3.13 Enrichissement
Nous enrichirons les noeuds par un troisième element (en plus de la valeur du caractere, et des enfants du noeud) de type entier.
Celui conrespondra à la valeur de la plus longue sous chaine commune parmi ses enfants.
## 3.14 Analyse des complexités
