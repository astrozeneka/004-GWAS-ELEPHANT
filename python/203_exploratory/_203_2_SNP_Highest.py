import pandas as pd

row_header = "# Catalog Locus ID	Cnt	EMAf10_q20_sorted	EMAf1_q20_sorted	EMAf28_q20_sorted	EMAf2_q20_sorted	EMAf3_q20_sorted	EMAf4_q20_sorted	EMAf5_q20_sorted	EMAf7_q20_sorted	EMAFf20_q20_sorted	EMAFf21_q20_sorted	EMAFf2_q20_sorted	EMAFf5_q20_sorted	EMAFf6_q20_sorted	EMAFm2_q20_sorted	EMAFm6_q20_sorted	EMAFm9_q20_sorted	EMAm10_q20_sorted	EMAm12_q20_sorted	EMAm13_q20_sorted	EMAm14_q20_sorted	EMAm16_q20_sorted	EMAm17_q20_sorted	EMAm18_q20_sorted	EMAm19_q20_sorted	EMAm1_q20_sorted	EMAm20_q20_sorted	EMAm2_q20_sorted	EMAm3_q20_sorted	EMAm5_q20_sorted	EMAm6_q20_sorted	EMAm7_q20_sorted	EMAm8_q20_sorted	EMAm9_q20_sorted"
row = "2684678	29	C/C	C/C	N/N	C/C	C/C	C/C	N/N	C/C	C/C	C/C	C/C	C/C	C/C	G/G	G/G	C/C	G/G	-	G/G	C/C	C/C	C/C	N/N	N/N	-	N/N	-	G/G	C/C	C/C	-	G/G	G/G"
if __name__ == '__main__':
    row = row.split("\t")
    row_header = row_header.split("\t")
    row_dict = {a:b for a,b in zip(row_header, row)}

    # the popmap
    popmap = open("../../popmap/EMA_popmap_tusk.txt").read().strip().split("\n")
    popmap = [a.split("\t") for a in popmap]
    popmap = {a:b for a,b in popmap}
    indiv_list = row_header[2:]
    df = pd.DataFrame(columns=["Tusk(T) / No tusk (NT)", "Allele"], index=indiv_list)
    for i in indiv_list:
        df["Tusk(T) / No tusk (NT)"][i] = popmap[i]
        df["Allele"][i] = row_dict[i]
    print()


    print()