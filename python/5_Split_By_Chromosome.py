
chromosomes = ['CM044020.1', 'CM044021.1', 'CM044022.1', 'CM044023.1', 'CM044024.1', 'CM044025.1', 'CM044026.1', 'CM044027.1', 'CM044028.1', 'CM044029.1', 'CM044030.1', 'CM044031.1', 'CM044032.1', 'CM044033.1', 'CM044034.1', 'CM044035.1', 'CM044036.1', 'CM044037.1', 'CM044038.1', 'CM044039.1', 'CM044040.1', 'CM044041.1', 'CM044042.1', 'CM044043.1', 'CM044044.1', 'CM044045.1', 'CM044046.1', 'CM044047.1', 'CM044048.1', 'JAMZQU010000004.1', 'JAMZQU010000005.1', 'JAMZQU010000011.1', 'JAMZQU010000012.1', 'JAMZQU010000020.1', 'JAMZQU010000025.1', 'JAMZQU010000026.1', 'JAMZQU010000028.1', 'JAMZQU010000034.1', 'JAMZQU010000039.1', 'JAMZQU010000040.1', 'JAMZQU010000041.1', 'JAMZQU010000042.1', 'JAMZQU010000044.1', 'JAMZQU010000052.1', 'JAMZQU010000054.1', 'JAMZQU010000055.1', 'JAMZQU010000058.1', 'JAMZQU010000059.1', 'JAMZQU010000060.1', 'JAMZQU010000061.1', 'JAMZQU010000062.1', 'JAMZQU010000063.1', 'JAMZQU010000064.1']
chromosomes = [c for c in chromosomes if 'CM' in c]


if __name__ == '__main__':
    data = open("../data/male_data.txt").read().split("\n")
    data = [d.split("\t") for d in data]

    # get only the VDB
    data = [a[0:2]+[b for b in a[2].split(";") if 'VDB' in b] for a in data if len(a) > 1]
    data = [a for a in data if len(a) == 3]
    data = [a[0:2]+[a[2].replace('VDB=', '')] for a in data]
    data = [a[:2]+[float(a[2])] for a in data]

    output = {c:[] for c in chromosomes}
    for row in data:
        output[row[0]].append(row)

    for chromosome in chromosomes:
        with open(f"../data/chromosomes/{chromosome}.txt", "w") as f:
            f.write("\n".join("\t".join([str(b) for b in a]) for a in output[chromosome]))
