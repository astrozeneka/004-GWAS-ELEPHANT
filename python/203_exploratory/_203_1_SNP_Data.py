

if __name__ == '__main__':
    # open the populations.haplotypes.tsv
    haplotypes = open("../../data/exploratory/populations.haplotypes.tsv").read().strip().split("\n")
    haplotypes = [a.split("\t") for a in haplotypes]

    # The fisher file
    fisher = open("../../data/fisher/fisher-tusk.assoc.fisher").read().strip().split("\n")
    fisher = [a.split() for a in fisher][1:]
    for i in range(len(fisher)):
        fisher[i][7] = float(fisher[i][7])
    fisher.sort(key=lambda x:x[7])
    print()