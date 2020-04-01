library(tidyverse)


###download data

mydata = read.csv("datafilm.csv",dec=",")

##simple visualization

ggplot(mydata, aes(nationality,score)) + geom_point(aes(size = comments))

ggplot(mydata, aes(nationality, n.voters)) + geom_point(aes(colour = factor(score)))


##how to reorder by mean  

  ggplot( mydata, aes(x=reorder(nationality,score,mean), y=score)) + 
  geom_point(aes(size = comments))
  
 
##custume  (by score >7)
  

  ggplot( mydata, aes(x=reorder(nationality,score,mean), y=score)) + 
    geom_point(aes(size = comments), color="#E54E53", alpha=0.8) +  geom_text( 
    data=mydata %>% filter(score>7), aes(label=film), size= 3, nudge_x = 0.2, nudge_y = 0.1, check_overlap = T) + theme_light() +
    labs(title = "Disturbing movies", x="countries", y="score",caption= "@Mcotsar") +
    theme(plot.background = element_rect(fill = "#F6FFFB", color=NA), panel.background = element_rect(fill = "#F6FFFB"), legend.key = element_rect(colour = "#EBF7EE", fill="#E9FFEE", linetype="solid"))
  
ggsave("disturbing.png",width=14, height=9)  

 
