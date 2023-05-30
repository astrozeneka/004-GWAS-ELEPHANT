

if __name__ == '__main__':
    data = open("../data/male_data.txt").read().split("\n")
    output = []
    for i,row in enumerate(data):
        if len(row) == 0:
            continue
        ch = row.split()[0]
        output.append(ch)
    output = set(output)
    output = list(output)
    print()