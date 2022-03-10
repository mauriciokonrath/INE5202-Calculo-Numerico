'''from datetime import datetime
import matplotlib.pyplot as plt
from math import exp, sqrt

def runge_kutta(f, x_0, y_0, h):
    k_0 = f(x_0, y_0)
    k_1 = f(x_0 + h/2, y_0 + h/2 * k_0)
    k_2 = f(x_0 + h/2, y_0 + h/2 * k_1)
    k_3 = f(x_0 + h, y_0 + h * k_2)

    k = 1/6 * (k_0 + 2.0*k_1 + 2.0*k_2 + k_3)

    x_1 = x_0 + h
    y_1 = y_0 + h * k

    return x_1, y_1


def f(x, y):
    """Example first order ordinary differential equation (ODE)"""
    return x-y+2


if __name__=="__main__":
    # Initial values
    N = 8
    x_0 =0
    y_0 = 1
    h = (y_0 - x_0) / N

    # Step length
    #h = 0.1

    x_values = [x_0]
    y_values = [y_0]

    # Calculate solution
    x = x_0
    y = y_0
    for _ in range(N):
        x, y = runge_kutta(f, x, y, h)
        x_values.append(x)
        y_values.append(y)
        print(x, y)

    # Plot solution
    plt.plot(x_values, y_values)
    plt.show()'''

import numpy as np

#A EDO
def f(x,y):
    return 4*(y*y)-4*y+8*(x*x)-16*x+4 #colocar a função aqui

#PVI
x0 = 0
y0 = 0

#Intervalo
a = 0
b = 1
N = 43 #numero de subdivisões

#calculando o H
h = (b-a)/N
print("h: ", h)
#vetores que irão acumular os pontos gerados
xi = [x0]
yi = [y0]

#iterando com método
for i in range(N):
    k1 = f(x0, y0)
    k2 = f(x0 + (h / 2), y0 + (h / 2) * k1)
    k3 = f(x0 + (h / 2), y0 + (h / 2) * k2)
    k4 = f(x0 + h, y0 + h * k3)
    yk = 1 / 6 * (k1 + 2.0 * k2 + 2.0 * k3 + k4)
    x0 = x0 + h
    y0 = y0 + h * yk
    print(f"({i}-  xk: {round(x0,5)}, yk: {round(y0,10)}, k1: {round(k1, 5)}, k2: {round(k2, 5)}, k3: {round(k3, 5)}, k4: {round(k4, 5)})")


#adicionando os pontos nos vetores
xi.append(round(x0, 5))
yi.append(round(yk, 10))

print()
print(xi)
print(yi)
