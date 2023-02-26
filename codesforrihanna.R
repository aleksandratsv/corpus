library(tidyverse)
library(spotifyr)
rihanna<-get_track_audio_features(c("5r67bGhYXZNqk2m2Wupfmu", "0GNI8K3VATWBABQFAzBAYe"))
rihanna

track_id<- '5r67bGhYXZNqk2m2Wupfmu'
audio_features <- get_track_audio_features(track_id)

df <- data.frame(danceability = audio_features$danceability, 
                 energy = audio_features$energy, 
                 loudness = audio_features$loudness)
library(ggplot2)

ggplot(df, aes(x = danceability, y = energy,)) +
  geom_point(aes(size = loudness)) +
  xlab("Danceability") +
  ylab("Energy") +
  scale_size_continuous(range = c(1, 10), name = "Loudness")


library(tidyverse)
library(spotifyr)
album_ids <- c('4UlGauD7ROb3YbVOFMgW5u', '4FyGpObwABjn0o8Tdp7AZz', '5pvFhFt1nzE8sCbm1wjNRv','3JSWZWeTHF4HDGt5Eozdy7','4XBfFj0WYyh5mBtU61EdyY', '1Kw1bVd07oRqcjrcjQKC8T','7vN82vd1Vq44fjlhjfvHJp')
albums <- get_albums(album_ids)
album_names <- albums$name
album_popularity <- albums$popularity
album_data <- data.frame(album_names, album_popularity)
library(ggplot2)
ggplot(album_data, aes(x = album_names, y = album_popularity)) + 
  geom_bar(stat = "identity", fill = "skyblue") + 
  xlab("Album") + ylab("Popularity") + 
  ggtitle("Popularity of all of Rihanna's albums from 2005 to 2016") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


library(tidyverse)
library(spotifyr)
library(compmus)
library(ggplot2)

Rihanna<- get_album_tracks("3JSWZWeTHF4HDGt5Eozdy7")
Rihanna
Rihanna_audio_features <- lapply(Rihanna$id, get_track_audio_features) %>% bind_rows()
head(Rihanna_audio_features)



Rihanna_audio_features$mode <- factor(Rihanna_audio_features$mode, levels = c(0, 1), labels = c("Minor", "Major"))



ggplot(Rihanna_audio_features, aes(x = mode, y = energy, fill = mode)) + 
  geom_boxplot() +
  labs(x = "Mode", y = "Energy", title = "Rihanna Album Track Audio Features") +
  scale_fill_manual(values = c("#377eb8", "#e41a1c"), labels = c("Minor", "Major")) +
  theme_classic()

