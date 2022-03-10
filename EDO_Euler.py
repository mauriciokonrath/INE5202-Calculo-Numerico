import numpy as np

#A EDO
def f(x,y):
    w = x*y # coloca a função aqui
    return w

#PVI
x0 = 0
y0 = 1

#Intervalo
a = 1.9
b = 2.4
N = 5 #numero de subdivisões

#calculando o H
h = (b-a)/N

print("h: ", h)
#vetores que irão acumular os pontos gerados


#iterando com método
for i in range(N):
    yk = y0 + h * f(x0, y0)
    print(f"(y{i+1}: {round(yk,4)})")
    y0 = yk
    x0 = x0 + h


