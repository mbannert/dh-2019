library(data.table)

# downloaded from
# http://www.gahetna.nl/collectie/index/nt00444
download.file("https://www.nationaalarchief.nl/sites/default/files/index_downloads/NL-HaNA_NT00444.zip",
              destfile =  "data/nl.zip")
unzip("data/nl.zip", exdir = "data/", overwrite = T)

# ~ 7.7 M records. 0.7 GB
nl <- fread("data/NT00444_OPVARENDEN.csv")


basel_diverse <- nl[grepl("Basel$|Bazel$|Basilea$|Basle$|Bale$",
                          nl$V6,
                          ignore.case = T),]


# Export to Excel
library(openxlsx)
write.xlsx(basel_diverse,
           file = "data/basel_diverse_nl.xlsx")
# to csv
fwrite(basel_diverse, file = "data/basel_diverse.csv")
