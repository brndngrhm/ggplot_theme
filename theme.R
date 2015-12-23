#ggplot theme

#Install / load packages----
library(ggplot2)
install.packages('extrafont')
library("extrafont")

#Import and list fonts----
font_import()
fonts()
fonttable()
loadfonts(device="win")

#Develop Theme----

#Fonts to plug into theme:
"Lucida Sans"
"Gil Sans MT"
"Verdana"
"Trebuchet MS"
"Georgia"
"Garamond"

theme_bg <-theme(panel.background=element_rect(fill="#F0F0F0")) + 
  theme(plot.background=element_rect(fill="#F0F0F0")) +
  theme(panel.grid.major=element_line(colour="#D0D0D0",size=.25)) +
  theme(axis.ticks=element_blank()) +
  theme(plot.title=element_text(face="bold",vjust=2,colour="#3C3C3C",size=22)) +
  theme(axis.text.x=element_text(size=14,colour="#535353",face="bold")) +
  theme(axis.text.y=element_text(size=14,colour="#535353",face="bold")) +
  theme(axis.title.y=element_text(size=14,colour="#535353",face="bold",vjust=1.5)) +
  theme(axis.title.x=element_text(size=14,colour="#535353",face="bold",vjust=-.5)) +
  theme(text=element_text(family="Lucida Sans"))

#A few color presets----

blue <- "dodgerblue"
blue.gray <- "#92B8B9"
light.blue <- "#53BFD6"
neon.blue <- "#3FDBDD"
green <- "green3"
dark.green <- "#3A685F"
bright.green <- "#70DB36"
light.green <- "#AAD966"
sea.green <- "#71EB86"
orange <- "#F1B432"
dark.orange <- "#CE8C27"
red <- "#C0533A"
dark.red <- "#794648"
yellow <- "#D5E335"
purple  <- "#7A6CD6"
dark.purple <- "#511C2E"
gray <- "#6B6F65"
light.gray <- "#84877D"
black <- "#29251F"

#Some examples----
library(datasets)
View(Orange)

(barplot <- ggplot(Orange, aes(x=Tree, y=circumference, fill = Tree)) + geom_bar(stat="identity", alpha = .7) + 
  scale_fill_manual(values = c(dark.red, dark.red, dark.red, dark.red, dark.red)) + 
  labs(x="\nTree", y="Age\n", title = "Age of Trees\n") + theme_bg + guides(fill = FALSE))

(scatterplot <- ggplot(Orange, aes(x=age, y=circumference, color = Tree)) + geom_point(size =4,alpha=.8) + 
  scale_color_manual(values = c(light.green, dark.red, gray, orange, neon.blue)) + 
  labs(x="\nTree", y="Age\n", title = "Age of Trees\n") + theme_bg + guides(fill = FALSE))