

if __name__ == '__main__':
    vcf = open("../../data/exploratory/populations.snps.vcf").read().strip().split("\n")
    vcf = [a.split("\t") for a in vcf if a[0:1] != ""]

    vcf_search = [a for a in vcf if len(a) > 2]

    vcf_search = [a for a in vcf_search if '2684678:54:-' in a[2]]
    print()