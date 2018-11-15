library(httr)
library(jsonlite)

baseAddress <- "https://definitions.ausdx.io/api/"
endpointSearch<- "search"
thingToSearch <- "car"

call1 <- paste(baseAddress,endpointSearch,"?query=",thingToSearch, sep="" )

get_query <- GET(call1)

queryjsonText <- content(get_query, "text")

query_json <- fromJSON(queryjsonText, flatten = TRUE)

query_df <- as.data.frame(query_json)