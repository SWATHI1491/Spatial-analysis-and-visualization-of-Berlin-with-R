# Load required libraries
library(leaflet)
library(dplyr)
library(ggplot2)


# Define the coordinates for Berlin
BERLIN_longitude = 13.4050
BERLIN_latitude = 52.5200



# Initialize the leaflet map
m <- leaflet() %>% setView(lng = BERLIN_longitude, lat = BERLIN_latitude, zoom = 12)

# Add markers to the map
attractions <- data.frame(name = c("Brandenburg Gate", "Reichstag Building", "Checkpoint Charlie", "Berlin Wall"),
                          lat = c(52.5163, 52.5186, 52.5074, 52.5097),
                          lng = c(13.3778, 13.3767, 13.3904, 13.3878))

m %>% addTiles() %>%
  addMarkers(data = attractions, popup = ~name)

# Load population density data and overlay it on the map
pop_density <- read.csv("D:/Certificates/R/berlin/pop_density_berlin.csv")


library(ggplot2)

# read in the data
pop_density <- read.csv("D:/Certificates/R/berlin/pop_density_berlin.csv")

# convert Area to numeric
pop_density$Area <- as.numeric(pop_density$Area)

# create the scatterplot
ggplot(data = pop_density, aes(x = Area, y = density)) +
  geom_point() +
  labs(x = "Area", y = "Population Density") +
  ggtitle("Scatterplot of Population Density vs. Area")

head(pop_density)

#Histogram of population density:
ggplot(data = pop_density, aes(x = density)) +
  geom_histogram(binwidth = 1000, fill = "dodgerblue4", alpha = 0.8) +
  labs(x = "Population Density", y = "Count") +
  ggtitle("Histogram of Population Density")

#Boxplot of population density by area:
ggplot(data = pop_density, aes(x = Area, y = density)) +
  geom_boxplot(fill = "dodgerblue4", alpha = 0.8) +
  labs(x = "Area", y = "Population Density") +
  ggtitle("Boxplot of Population Density by Area")

#Density plot of population density by area:
ggplot(data = pop_density, aes(x = density, fill = Area)) +
  geom_density(alpha = 0.5) +
  scale_fill_viridis_d() +
  labs(x = "Population Density", y = "Density") +
  ggtitle("Density Plot of Population Density by Area")

