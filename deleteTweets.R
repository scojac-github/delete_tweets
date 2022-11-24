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

# Create a list of all tweet ids
tweet_ids <- tweets$id_str

# Convert to data frame
tweet_df <- as.data.frame(tweet_ids)

# Do a loop to delete the tweets
for (i in seq_along(tweet_df$tweet_ids)) {
  message("Deleting tweet number ", i, " of ", nrow(tweet_df))
  post_destroy(tweet_df$tweet_ids[i])
}

