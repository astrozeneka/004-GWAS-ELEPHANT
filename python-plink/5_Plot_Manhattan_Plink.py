
import numpy as np
import matplotlib.pyplot as plt
chromosomes = ['CM044020.1', 'CM044021.1', 'CM044022.1', 'CM044023.1', 'CM044024.1', 'CM044025.1', 'CM044026.1', 'CM044027.1', 'CM044028.1', 'CM044029.1', 'CM044030.1', 'CM044031.1', 'CM044032.1', 'CM044033.1', 'CM044034.1', 'CM044035.1', 'CM044036.1', 'CM044037.1', 'CM044038.1', 'CM044039.1', 'CM044040.1', 'CM044041.1', 'CM044042.1', 'CM044043.1', 'CM044044.1', 'CM044045.1', 'CM044046.1', 'CM044047.1', 'JAMZQU010000004.1', 'JAMZQU010000005.1', 'JAMZQU010000012.1', 'JAMZQU010000020.1', 'JAMZQU010000025.1', 'JAMZQU010000028.1', 'JAMZQU010000034.1', 'JAMZQU010000040.1', 'JAMZQU010000055.1', 'JAMZQU010000059.1', 'JAMZQU010000060.1']

if __name__ == '__main__':
    plt.figure(figsize=(12, 6))
    plt.xlabel("Chromosome")
    plt.ylabel("-log10(p-value)")

    # Calculate the Benferroni value
    snp_len = open("../data/fisher.assoc.fisher").read().count("\n") -2
    bonferroni = -1 * np.log10(0.05 / snp_len)

    offset = 0
    for i, chromosome in enumerate(chromosomes):
        if "CM" not in chromosome:
            continue
        print(f"{chromosome}")
        chromosome_data = open(f"../data/chromosomes-plink/{chromosome}.txt").read().strip().split("\n")
        chromosome_data = [a.split() for a in chromosome_data]
        print()
        X = []
        Y = []
        maximum = 0
        for a in chromosome_data:
            if a[7] == 'NA':
                continue
            chr = a[0]
            x = int(a[2])
            y = -1 * np.log10(float(a[7]))
            X.append(offset + x)
            Y.append(y)
            if x > maximum:
                maximum = x
        offset += maximum
        plt.scatter(X, Y, s=3)
    plt.axhline(y=bonferroni, color='red', linewidth=0.3)
    plt.savefig(f"../figs-plink/Manhattan-complete-{i}.png")
