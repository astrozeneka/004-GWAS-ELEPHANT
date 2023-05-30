
import numpy as np
chromosomes = ['CM044036.1', 'JAMZQU010000060.1', 'CM044033.1', 'CM044034.1', 'CM044021.1', 'CM044045.1', 'JAMZQU010000061.1', 'CM044023.1', 'JAMZQU010000004.1', 'CM044024.1', 'JAMZQU010000026.1', 'CM044025.1', 'CM044037.1', 'JAMZQU010000039.1', 'JAMZQU010000034.1', 'JAMZQU010000025.1', 'CM044032.1', 'CM044038.1', 'JAMZQU010000054.1', 'JAMZQU010000012.1', 'CM044030.1', 'CM044029.1', 'CM044035.1', 'CM044044.1', 'JAMZQU010000040.1', 'CM044039.1', 'CM044043.1', 'JAMZQU010000028.1', 'CM044027.1', 'JAMZQU010000041.1', 'CM044048.1', 'JAMZQU010000044.1', 'CM044047.1', 'JAMZQU010000042.1', 'JAMZQU010000063.1', 'CM044031.1', 'CM044041.1', 'CM044042.1', 'JAMZQU010000052.1', 'JAMZQU010000020.1', 'CM044046.1', 'JAMZQU010000005.1', 'CM044020.1', 'CM044026.1', 'CM044040.1', 'JAMZQU010000064.1', 'JAMZQU010000055.1', 'JAMZQU010000011.1', 'JAMZQU010000059.1', 'JAMZQU010000062.1', 'CM044028.1', 'JAMZQU010000058.1', 'CM044022.1']

if __name__ == '__main__':
    data = open("../data/male_data.txt").read().split("\n")
    min_list = {a:np.inf for a in chromosomes}
    max_list = {a:-np.inf for a in chromosomes}

    for row in data:
        if len(row) == 0:
            continue
        arr = row.split()
        ch = arr[0]
        pos = int(arr[1])
        if pos < min_list[ch]:
            min_list[ch] = pos
        if pos > max_list[ch]:
            max_list[ch] = pos
    print()