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
