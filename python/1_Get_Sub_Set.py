

if __name__ == '__main__':
    # Try to plot the P-value for the chromosome
    data = open("../data/male_data.txt").read().split("\n")
    #c_data = [d for d in data if 'CM044020.1' in data]
    #c_data = [d.split("\t") for d in c_data]
    print()
    with open("../data/first_chromosome.txt", "w") as f:
        txt = "\n".join(["\t".join(a) for a in c_data])
