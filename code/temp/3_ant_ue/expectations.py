import sys
import numpy as np

M = int(sys.argv[1])
bits = int(sys.argv[2])

theta = np.arange(0, np.pi / 2, 1e-4)

x = np.linspace(0, np.pi / 2, 2**bits + 1)
y = x + np.pi / 2 / 2**bits / 2
quantization_points = y[:-1]
theta_hat = [quantization_points[np.argmin(abs(i - quantization_points))] for i in theta]

pdf = (2 * M) * np.sin(theta)**(2 * M - 1) * np.cos(theta)

#print(np.trapz(pdf * (np.cos(theta) - np.cos(theta_hat))**2, theta)+np.trapz(pdf * (np.sin(theta) - np.sin(theta_hat))**2, theta))
print(np.trapz(pdf * (np.cos(theta) - np.cos(theta_hat))**2, theta))
