# Script to store the entire elasticsearch search result into a dataframe for further analysis.
# Change the below before running this script,
# localhost = the elastic search ip
# port = the elasticsearch port
# query = your search query
# index = elasticsearch index name
# doc_type = the type in index

# import the required libraries.
import pandas as pd
from elasticsearch import Elasticsearch, helpers

# elasticsearch object.
es = Elasticsearch('localhost', port=9200)

# define the python generator object.
res = helpers.scan(
                client = es,                                     
                scroll = '2m',
                query = {"_source": ["id", "timestamp", "value"],
                         "query":{'match_all':{}}
                        }, 
                index = "ec2_cpu",
                doc_type= "cpu_data")

# define an empty dataframe to store the search result.
df = pd.DataFrame()

# the search results are returned in dictionary format, so create a list of result dictionaries,which is 'l' here.
l=[]
for i in res:
    #print((i['_source']))
    l.append(i['_source'])

# Convert the list of result dictionaries to dataframe 
df = pd.DataFrame.from_dict(l)

# Check some rows of dataframe
df.head()
