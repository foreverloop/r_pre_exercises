library(tidyverse)

head(mpg)
help(mpg)
#ordered bar
ggplot(mpg,aes(x = reorder(`manufacturer`,`manufacturer`, 
                                  function(x)-length(x)),fill = `manufacturer`)) + 
geom_bar()

#scatter plot of city miles per gallon vs highway miles per gallon
ggplot(mpg,aes(x= cty, y=hwy,color=manufacturer)) +
geom_jitter()

#basic scatter plot of displ against highway efficiency
ggplot(data = mpg) + 
geom_point(mapping = aes(x = displ,y = hwy))

#scatter plot of litre of engine vs highway efficiency, color by class
ggplot(data = mpg) + 
geom_point(mapping = aes(x = displ,y = hwy,color=class))

#change size (usually best on a continuous data type)
ggplot(data = mpg) + 
geom_point(mapping = aes(x = displ,y = hwy,color=class,size=class))

#alpha affects transparency, shape affects the symbols used in the plot. All based on the column 'class'
ggplot(data = mpg) + 
geom_point(mapping = aes(x = displ,y = hwy,color=class,alpha=class))

#the color blue is a parameter of geom_point if it is not being used dynamically with data
ggplot(data = mpg) + 
geom_point(mapping = aes(x = displ,y = hwy,color=class),color='blue')

#facet wrap (plot displ for hwy individually by class)
ggplot(data = mpg) + 
geom_point(mapping = aes(x = displ,y = hwy,color=class)) + 
facet_wrap( ~ class,nrow =2)

#bar graph with diamonds data
ggplot(data = diamonds) +
geom_bar(mapping = aes(x = cut))

#this is like a temp table/temp dataframe
demo <- tribble(~cut,~freq,
                'Fair',1610,
                'Good',4906,
                'Very Good',12082,
                'Premium',13791,
                'Ideal',21531)
ggplot(data = demo) +
geom_bar(mapping = aes(x = cut, y = freq),stat = 'identity')

#bar chart for proportion rather than count
ggplot(data = diamonds) +
geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

#using stat_summary is a way of summarising the y value for each x value
ggplot(data = diamonds) +
stat_summary(mapping = aes(x = cut, y = depth),
             fun.ymin = min,fun.ymax = max, fun.y = median)

#Position Arguments (coloring bar charts)

#This version just colours the borders
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut,color= cut))

#positional arguments 2, full colour bars

#bar defaults to a count. 
#then in the aesthetic function, 
#we specified the fill parameter based on cut, which is also the x param
ggplot(data = diamonds) +
geom_bar(mapping = aes(x = cut, fill = cut))

#by supplying a categorical fill value, we get a stacked bar
ggplot(data = diamonds) +
geom_bar(mapping = aes(x = cut, fill = clarity))

#install.packages('maps')
nz <- map_data('nz')
summarise()
ggplot(nz,aes(long,lat,group=group)) +
geom_polygon(fill='salmon',color='salmon') +
coord_quickmap()

#install.packages('tinytex')
ggplot(mpg,aes(x=trans,color=trans)) +
geom_bar()

#passing the mapping straight in to gg plot
#we then specify geometric bar and alpha is used to alter the transparency
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
geom_bar(alpha = 1/5, position = 'identity')

#wireframes only
ggplot(data = diamonds, mapping = aes(x = cut, color = clarity)) +
geom_bar(fill = NA, position = 'identity')

#clarity as a percentage of each cut
ggplot(data = diamonds) +
geom_bar(mapping = aes(x = cut, fill = clarity), position = 'fill')

#frequencies of cut against clarity
ggplot(data = diamonds) +
geom_bar(mapping = aes(x = cut,fill = clarity), position = 'dodge')

#multiple geoms on same data
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
geom_point(mapping = aes(color=class)) + 
geom_smooth(data = filter(mpg,class=='subcompact'), se = FALSE)

#geom point usually performs rounding on x and y values.
#the argument jitter adds a small amount of noise back in so the points can be plotted in full
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), position = 'jitter')

#geom_jitter is  a sub class of geom_point, with position = 'jitter' by default 
ggplot(data = mpg) +
geom_jitter(mapping = aes(x = displ, y = hwy))

#normal set of box plots
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()

#normal set of box plots, but x and y are flipped
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
geom_boxplot() +
coord_flip()

#singling out compacts for a box plot
ggplot(data = filter(mpg,class=='compact'), mapping = aes(x = class, y = hwy)) + 
geom_boxplot() +
coord_flip()

bar <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut),
           show.legend = FALSE,
           width = 1) +
  theme(aspect.ratio = 1) +
  labs(x = NULL,y = NULL)

bar + coord_flip()
bar + coord_polar()

#vanilla style
plot(c(1:10),c(1:10)) +
lines(c(1:10),col='red') +
points(x=c(4:10),y=(c(1,2,3,4,5,6,7)))
