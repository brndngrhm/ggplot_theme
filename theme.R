#ggplot theme

#install extrafont package (optional)----
install.packages('extrafont')
font_import()
fonts()
fonttable()

#load packages----
library(ggplot2)
library(extrafont)
library(ggthemes)
library(grid)

#Import and list fonts----
loadfonts(device="win")
fonttable()

#Fonts to plug into font.type variable----
"Lucida Sans"
"Gil Sans MT"
"Verdana"
"Trebuchet MS"
"Georgia"
"Garamond"

#Global theme options - to easily all plots at once----
font.type <- "Trebuchet MS"
background.color <- "#f1f1f1"
line.color <- "#d8d8d8"
title.color <- "#3C3C3C"
title.size <- 22
axis.color <- "#535353"
axis.size <- 14

transparency <- .7 #for alpha
line.size <- 1.6 #for geom_line()
point.size <- 3 #for geom_point()

#theme----
theme_bg <-theme(panel.background=element_rect(fill=background.color)) + 
  theme(plot.background=element_rect(fill=background.color)) +
  theme(panel.grid.major=element_line(colour=line.color,size=.60)) +
  theme(panel.grid.minor=element_line(colour=line.color,size=.05)) +
  theme(axis.ticks=element_blank()) +
  theme(plot.title=element_text(face="bold",vjust=2, hjust=-.07, colour=title.color,size=title.size)) +
  theme(axis.text.x=element_text(size=axis.size,colour=axis.color)) +
  theme(axis.text.y=element_text(size=axis.size,colour=axis.color)) +
  theme(axis.title.y=element_text(size=axis.size,colour=axis.color,vjust=1.5)) +
  theme(axis.title.x=element_text(size=axis.size,colour=axis.color,vjust=-.5)) +
  theme(text=element_text(family=font.type))

#theme options (to add plots inividually)----

#to add bold line at y=0
geom_hline(yintercept=0,size=1.2,colour="#535353")

#to change plot margins
theme(plot.margin = unit(c(1, 1, .5, .7), "cm"))

#to get rid of legend
theme(legend.position="none")
guides(fill = FALSE)

#to format legend when it's needed
theme(legend.background = element_rect(fill=background.color)) + 
  theme(legend.key = element_rect(colour = background.color)) + 
  theme(legend.direction = "horizontal", legend.position = "bottom")

#single color presets so I dont need to remember exact names or hex codes----
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

#scale_colour/scale_fill pallettes from ggthemes----
scale_colour_calc()
scale_colour_colorblind()
scale_colour_economist()
scale_colour_excel()
scale_colour_few()
scale_colour_gdocs()
scale_colour_hc()
scale_colour_solarized()
scale_colour_stata()
scale_colour_tableau()
scale_colour_pander()

#Some examples----
library(datasets)
View(Orange)

(barplot <- ggplot(Orange, aes(x=Tree, y=circumference, fill = Tree)) + geom_bar(stat="identity", alpha = transparency) + 
  scale_fill_manual(values = c(dark.purple, gray, light.gray, purple, black)) + 
  labs(x="\nTree", y="Age\n", title = "Age of Trees\n") + theme_bg + guides(fill = FALSE) + 
  geom_hline(yintercept=0,size=1.2,colour="#535353") + 
  theme(plot.margin = unit(c(1, 1, .5, .7), "cm")))

(scatterplot <- ggplot(Orange, aes(x=age, y=circumference, color = Tree)) + geom_point(size =4,alpha=.8) + 
  scale_color_manual(values = c(light.green, dark.red, gray, orange, neon.blue)) + 
  labs(x="\nTree", y="Age\n", title = "Age of Trees\n") + theme_bg + 
  geom_line(size = line.size, alpha=transparency) + 
  theme(legend.background = element_rect(fill=background)) + 
  theme(legend.key = element_rect(colour = background)) + 
  theme(legend.direction = "horizontal", legend.position = "bottom"))

