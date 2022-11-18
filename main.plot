set term png
set output 'assets/dynamique.png'
set title 'programmation dynamique'

set xlabel "size"
set ylabel "duration"

plot  "exp_result/dynamic.result" using 1:2
