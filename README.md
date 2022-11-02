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

$$ L(i, j) = \left\{
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
## 3.7 Comment savoir si une chaine C2 est une sous chaine d'une chaine C1.
## 3.8 Définir une structure de données et les primitives permettant de manipuler les arbres des suffixes
## 3.9 Definition de la fonction de construction de l'arbre des suffixes `ArbreSuffixes(str) -> Arbre`
## 3.10 Predicat pour verifier qu'une chaine est une sous-chaine de l'autre `SousChaine(str, str) -> bool`
## 3.11 Jeu de tests
## 3.12 Analyse de la complexité (en temps, en espaces)
## 3.13 Enrichissement
## 3.14 Analyse des complexités
