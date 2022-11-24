library(rtweet)
library(tidyverse)
library(dplyr)
library(purrr)

# Auth into Twitter
auth_setup_default()

# Twitter username
user <- "NotSJ215"

# Get tweets
tweets <- get_timeline(user, n = Inf)
head(tweets, 5)

# Save tweets for safekeeping
write_csv(tweets, "data/tweets.csv")

# Get your timeline
my_timeline <- get_timeline(user)
head(my_timeline, 5)
colnames(my_timeline)

# Create a list of all tweets
# tweet_ids <- my_timeline$id_str

# Delete a single tweet using the post_destroy parameter
post_destroy(tweet_ids[1])

# Do the delete!
delete_tweets <- my_timeline %>% 
  mutate(success = map(id_str, possibly(post_destroy, otherwise = "fail")))