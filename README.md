# python_elasticsearch
scripts for index,search 

# build_es_index.py
1. change host, port, index_name and index_type
2. run the script by passing a csv file as command line argument.
e.g. python build_es_index.py ec2_cpu_utilization.csv

# es_to_pandas_df.py
Script to store the entire elasticsearch search result into a dataframe for further analysis.
Change the below before running this script,
1. Change localhost to the elastic search ip
2. port = the elasticsearch port
3. query = your search query
4. index = elasticsearch index name
5. doc_type = the type in index

# es_to_R_df.R
This is a R script to load all the elasticsearch index search response to a R dataframe.
Change the below before running the script.
1. es_host and es_port.
2. body, which is the search query.
3. index, type

# build_index_from_R_csv.R
1. This is a R script to index a csv file into a elastic search index.
2. Change the following,
host_ip, index_name, index_type.
3. Below is the command to run this cript.
Rscript build_index_from_R_csv.R raw_data.csv
