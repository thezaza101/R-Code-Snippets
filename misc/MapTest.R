

world.map <- map_data ("world")
au.map <- world.map %>% filter(region == "Australia")
au.map <- fortify(au.map)


ggplot() + 
  geom_map(data=au.map, map=au.map,
           aes(x=long, y=lat, group=group, map_id=region),
           fill="white", colour="black")
