import json
import numpy as np
import matplotlib.pyplot as plt
import os


fisher_path = "../data/fisher/fisher-tusk.assoc.fisher"
if __name__ == '__main__':
    chromosome_json = "../data/fisher/chromosomes.json"
    if not os.path.exists(chromosome_json):
        data = open(fisher_path).read().strip().split("\n")[1:]
        data = [d.split() for d in data]
        chromosomes = [d[0] for d in data]
        chromosomes = list(set(chromosomes))
        chromosomes = sorted(chromosomes)
        chromosomes = [a for a in chromosomes if "CM" in a]
        json.dump(chromosomes, open(chromosome_json, "w"))
    else:
        chromosomes = json.load(open(chromosome_json))

    print()
    # MAKE THE MANHATTAN
    data = open(fisher_path).read().strip().split("\n")[1:]
    data = [d.split() for d in data]
    output = {c: [] for c in chromosomes}
    for row in data:
        if row[0] in chromosomes:
            output[row[0]].append(row)

    for chromosome in chromosomes:
        chromosome_file = f"../data/fisher/tusk-by-chromosomes/{chromosome}.txt"
        if not os.path.exists(chromosome_file):
            with open(chromosome_file, "w") as f:
                f.write("\n".join("\t".join([str(b) for b in a]) for a in output[chromosome]))

    # Plotting Manhattan
    print("Drawing manhattan")
    plt.figure(figsize=(12, 6))
    plt.xlabel("Chromosome")
    plt.ylabel("-log10(p-value)")

    # Calculate the Benferroni value
    snp_len = open("../data/fisher/fisher-tusk.assoc.fisher").read().count("\n") - 2
    bonferroni = -1 * np.log10(0.05 / snp_len)


    offset = 0
    for i, chromosome in enumerate(chromosomes):
        print(f"{chromosome}")
        chromosome_data = open(f"../data/fisher/tusk-by-chromosomes/{chromosome}.txt").read().strip().split("\n")
        chromosome_data = [a.split() for a in chromosome_data]
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
        plt.scatter(X, Y, s=0.5)
    plt.axhline(y=bonferroni, color='red', linewidth=0.3)
    plt.savefig(f"../data/fisher-manhattan/tusk.png")
    print("Done")
    print()
