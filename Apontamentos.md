# Apontamentos dos slides da teoria do trabalho

## Simulação

1. Dada a posição inicial dos atomos r <sup>(t=0)</sup>  escolher um *𝜟t*
2. Obter F = -∇ V(r<sup>(i)</sup>) e a = F/m
3. Mover os atomos: r<sup>(i+1)</sup> = r<sup>(i)</sup> + v<sup>(i)</sup>𝜟t + ½a𝜟t<sup>2</sup> + ...
4. Mover tempo pra frente: t = t + 𝜟t
5. Repetir quantas vezes quiser

### Potencial de Lennard-Jones

𝟇\(r\) = 4 * 𝜀[(σ/r)² - (σ/r)⁶]

r -> distancia entre particulas
𝛆 = profundidade de campo 
σ = distancia onde o campo é nulo

### FALTA ACABAR


## Coisas que vi no codigo

### Kinetic()

notei que no ciclo ele faz /2., sendo que podemos colocar no final e assim reduzimos uma operacao de doubles por ciclo, e podemos tambem tirar o ciclo que está no meio pras 3 posicoes do vetor

### Potential()

desdobrar o ciclo mais interior

meter o if para o contrario (n sei se ajudaria)
