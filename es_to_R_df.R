# This is a R script to load all the elasticsearch index search response to a R dataframe.
# Change the below before running the script.
# 1. es_host and es_port.
# 2. body, which is the search query.
# 3. index, type


# Install the "elastic" package if not installed.
# install.packages("elastic")

# Import the required packages.
library("elastic")
library("data.table")

# Define the elasticsearch connection
connect(es_host = 'localhost', es_port = 9200)

# The body of the elasticsearch query to get all documents
body <- '{
"query": {"match_all" : {}}
}'

# Search
res <- Search(index = 'ec2_cpu_forecast', type='cpu_data_forecast', 
              time_scroll="5m", body=body)
              
# But the above results in only first 10 response. So add them to a list and iterate from next.
out <- list()
out <- c(out, res$hits$hits)
hits <- 1
while(hits != 0){
    res <- scroll(res$`_scroll_id`)
    hits <- length(res$hits$hits)
    if(hits > 0)
        out <- c(out, res$hits$hits) 
}

# Convert to dataframe
library("data.table")
df <- setDF(data.table::rbindlist(
  lapply(out, "[[", "_source"),
  fill = TRUE, use.names = TRUE
))

# Check dim of dataframe df
dim(df)

head(df)
