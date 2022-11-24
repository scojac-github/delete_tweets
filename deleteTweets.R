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
tweet_ids <- my_timeline$id_str

# Convert to data frame
tweet_df <- as.data.frame(tweet_ids)
head(tweet_df)

# Do a loop to delete the tweets
for (i in seq_along(tweet_df$tweet_ids)) {
  message("Deleting tweet number ", i)
  post_destroy(tweet_df$tweet_ids[i])
}
