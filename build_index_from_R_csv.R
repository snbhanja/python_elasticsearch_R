# This is a R script to index a csv file into a elastic search index.
# Change the following,
# host_ip, index_name, index_type.
# Below is the command to run this cript,
# Rscript build_index_from_R_csv.R raw_data.csv

args<-commandArgs(TRUE)
file_name = args[1]

df <- read.csv(file=file_name, header=TRUE, sep=",")

# import the elastic package
library("elastic")

host_ip <- '35.203.187.180'
connect(es_host = host_ip, es_port = 9200)

# CSV format
#timestamp,count,job_id
#1980-09-25 14:01:00,182.478,job001

#if (index_exists('raw_index2'))
#    print("Index laready exists..so deleting...")
#    index_delete(index='raw_index2')

# Create a mapping for the index
mapping <- list(
  raw_type2 = list(properties = list(
    timestamp = list(
      type = "date",
      format = "yyyy-MM-dd HH:mm:ss"
    ),
    count = list(type = "float"),
    job_id = list(type = "keyword")
)))

#Make the index
index_create(index = "raw_index2")

# Create the mapping in the index
mapping_create(index = "raw_index2", type = "raw_type2", body = mapping)

# Bulk load the datframe
docs_bulk(df, index = "raw_index2", type = "raw_type2", chunk_size = 1000)
