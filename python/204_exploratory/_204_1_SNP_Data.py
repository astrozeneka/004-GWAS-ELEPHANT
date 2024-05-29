

if __name__ == '__main__':

    # The fisher file (Hair)
    fisher = open("../../data/fisher-old.assoc.fisher").read().strip().split("\n")
    fisher = [a.split() for a in fisher][1:]
    for i in range(len(fisher)):
        fisher[i][7] = float(fisher[i][7])
    fisher.sort(key=lambda x: x[7])
    print()