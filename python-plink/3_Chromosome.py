

if __name__ == '__main__':
    data = open("../data/fisher.assoc.fisher").read().strip().split("\n")[1:]
    data = [d.split() for d in data]
    chromosomes = [d[0] for d in data]
    chromosomes = list(set(chromosomes))
    print()