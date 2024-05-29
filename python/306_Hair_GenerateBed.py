
import numpy as np
import matplotlib.pyplot as plt
chromosomes = ['CM044020.1', 'CM044021.1', 'CM044022.1', 'CM044023.1', 'CM044024.1', 'CM044025.1', 'CM044026.1', 'CM044027.1', 'CM044028.1', 'CM044029.1', 'CM044030.1', 'CM044031.1', 'CM044032.1', 'CM044033.1', 'CM044034.1', 'CM044035.1', 'CM044036.1', 'CM044037.1', 'CM044038.1', 'CM044039.1', 'CM044040.1', 'CM044041.1', 'CM044042.1', 'CM044043.1', 'CM044044.1', 'CM044045.1', 'CM044046.1', 'CM044047.1', 'JAMZQU010000004.1', 'JAMZQU010000005.1', 'JAMZQU010000012.1', 'JAMZQU010000020.1', 'JAMZQU010000025.1', 'JAMZQU010000028.1', 'JAMZQU010000034.1', 'JAMZQU010000040.1', 'JAMZQU010000055.1', 'JAMZQU010000059.1', 'JAMZQU010000060.1']
FLANKING_REGION = 300000
if __name__ == '__main__':
    plt.figure(figsize=(12, 6))
    plt.xlabel("Chromosome")
    plt.ylabel("-log10(p-value)")

    # Calculate the Benferroni value
    snp_len = open("../data/fisher-old.assoc.fisher").read().count("\n") -2
    bonferroni = -1 * np.log10(0.05 / snp_len)
    potential_bonferroni = -1 * np.log10(1 / snp_len)

    output = {
        "sig": [],
        "pot":  []
    }
    for i, chromosome in enumerate(chromosomes):
        if "CM" not in chromosome:
            continue
        chromosome_data = open(f"../data/chromosomes-plink/{chromosome}.txt").read().strip().split("\n")
        chromosome_data = [a.split() for a in chromosome_data]

        for a in chromosome_data:
            if a[7] == 'NA':
                continue
            log10_val = - np.log10(float(a[7]))
            if log10_val > bonferroni:
                output["sig"].append(a)
            elif log10_val >  potential_bonferroni:
                output["pot"].append(a)

    for type in ["sig", "pot"]:
        snp_list = output[type]
        bed_content = []
        for snp in snp_list:
            bed_content.append("\t".join([
                snp[0],
                str(max(0, int(snp[2]) - FLANKING_REGION)),
                str(int(snp[2]) + FLANKING_REGION)
            ]))
        bed_content = "\n".join(bed_content)
        with open(f"../data/306_GeneAnnotation/regions-{type}.bed", "w") as f:
            f.write(bed_content)
        print("Done")
    print()