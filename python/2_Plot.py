import numpy as np
import matplotlib.pyplot as plt

if __name__ == '__main__':
    data = open("../data/first_chromosome.txt").read().split("\n")
    data = [d.split("\t") for d in data]

    # get only the VDB
    data = [a[0:2]+[b for b in a[2].split(";") if 'VDB' in b] for a in data]
    data = [a for a in data if len(a) == 3]
    data = [a[0:2]+[a[2].replace('VDB=', '')] for a in data]
    data = [a[:2]+[float(a[2])] for a in data]

    # Filter by the VPS value

    # Plot
    X = [int(a[1]) for a in data]
    Y = [- np.log10(float(a[2])) for a in data]
    plt.figure(figsize=(12, 6))
    plt.scatter(X, Y)
    plt.xlabel("Chromosome")
    plt.ylabel("-log10(p-value)")
    plt.savefig("Manhattan.png")

    print()



    print()