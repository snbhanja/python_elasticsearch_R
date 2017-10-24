# Edit index name and type before running
import sys
import pandas as pd
from elasticsearch import Elasticsearch
from elasticsearch import helpers

host = [{'host': 'localhost', 'port': 9200}]
index_name, index_type = 'raw_index', 'raw_type'
es = Elasticsearch(host)

if es.indices.exists(index_name):
    print("deleting '%s' index..." % (index_name))
    res = es.indices.delete(index = index_name)
    print(" response: '%s'" % (res))