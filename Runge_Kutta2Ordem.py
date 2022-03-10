import numpy as np

#A EDO
def f(x,y):
    return x+3*y #colocar a função aqui

#PVI
x0 = 0
y0 = 2

#Intervalo
a = 0
b = 1
N = 8 #numero de subdivisões

#calculando o H
h = (b-a)/N
print("h: ", h)
#vetores que irão acumular os pontos gerados
xi = [x0]
yi = [y0]

#iterando com método
for i in range(N):
    k1 = f(x0, y0)
    k2 = f(x0+h, y0+h * k1)
    yk = y0 + 0.5 * (k1+k2) * h
    x0 = x0 + h
    y0 = yk
    print(f"({i}-  xk: {round(x0,10)}, yk: {round(y0,10)}, k1: {round(k1, 10)}, k2: {round(k2, 10)})")




#adicionando os pontos nos vetores
xi.append(round(x0, 5))
yi.append(round(yk, 10))

print()
print(xi)
print(yi)

