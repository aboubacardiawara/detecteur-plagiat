# Detecteur de plagiat

# Auteurs:
- todo
- todo

# Responses aux questions
## 2.1 Sous structure optimale.
### 2.1.1 Quelques exemples
Exemple1: Soit deux chaines C1 et C2 respectivement egale à ANANAS et BANANE.
La plus longue sous chaine commune est: ANAN.
*[ANAN]AS et B[ANAN]E*

Exemple2: Soit deux chaines C1 et C2 respectivement egale à FOO et TIMOLEON.
La plus longue sous chaine commune est: O.
*F[O]O et TIM[O]LEON*

### 2.1.2 Determination de la sous structure optimale
Soit deux chaines:
 $$S1 = x_1 x_2 x_3....x_n$$
 $$S2 = y_1 y_2 y_3....y_n$$

On veut determiner la longueur de la plus longue chaine S':
$$S'=x_i, x_{i+1}x_{i+2}...x_{i+k-1}=y_j, y_{j+1}y_{j+2}...x_{j+k-1}$$ 

$$ L(i, j) = \left\{
\begin{array}{ll}
 0 & {si} & x_i \neq y_j \\
 1 + L(i-1, j-1) & sinon 
\end{array}
\right. $$

## 2.2 Deduction de la longueur.

## 2.3 Equation associée à la sous structure optimale.

## 2.4 Enrichissement. Determination de la position d'une des sous chaines. 

## 2.5 Analyse de la complexité.
*/!\ Préciser ce qu'on mesure*

## Etapes d'implementation
- [ ] Terminé totalement
- [ ] Jeu de tests valides 