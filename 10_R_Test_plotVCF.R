if (!require("devtools")) install.packages("devtools")
if (!require("BiocManager")) install.packages("BiocManager")
remotes::install_github(
    "cccnrc/plot-VCF",
    repos = BiocManager::repositories()
)
library(plotVCF)
VCF <- '/tarafs/data/project/proj5034-AGBKU/map_bwa_ema_Ryan/vcf_results/male.vcf'
createVCFplot( VCF )