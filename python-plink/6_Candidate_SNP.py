

if __name__ == '__main__':
    fisher_data = open("../data/fisher.assoc.fisher").read().strip().split("\n")
    fisher_data = [l.split() for l in fisher_data]
    fisher_data = [(l[0], l[1], float(l[7])) for l in fisher_data[1:]]
    fisher_data.sort(key=lambda x:x[2], reverse=False)
    print()