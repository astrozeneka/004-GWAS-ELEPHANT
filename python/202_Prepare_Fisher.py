import json
import numpy as np
import matplotlib.pyplot as plt
import os




fisher_path = "../data/plink/200/fisher.assoc.fisher"
if __name__ == '__main__':
    chromosome_json = "../data/fisher/chromosomes.json"
    chromosomes = json.load(open(chromosome_json))

    output = []
    fisher_data = open(fisher_path).read().split("\n")
    for i, line in enumerate(fisher_data):
        if i == 0:
            output.append(line)
        found = False
        for chr in chromosomes:
            if chr in line:
                # Filter
                new_l = line.split()
                if len(new_l) != 9:
                    break
                if new_l[8] == "NA":
                    break
                output.append(
                    line.replace(chr, str(chromosomes.index(chr)+1))
                )
                found = True
                break

    output = "\n".join(output)
    open("../data/plink/200/fisher.assoc.fisher-v2", "w").write(output)
    print("Done")