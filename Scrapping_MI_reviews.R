# Import the libraries

library(robotstxt)
library(rvest)

# Assign a variable for the url

url <- "https://www.flipkart.com/search?q=mi+mobiles&sid=tyy%2C4io&as=on&as-show=on&otracker=AS_QueryStore_OrganicAutoSuggest_1_2_na_na_na&otracker1=AS_QueryStore_OrganicAutoSuggest_1_2_na_na_na&as-pos=1&as-type=HISTORY&suggestionId=mi+mobiles%7CMobiles&requestId=f0d40a36-e732-46c5-8bd0-b93bbfa7fa74&page=2"

# Check whether the website is allowed to scrap

path <- paths_allowed(url)

# HTML elements from the website

web <- read_html(url)

# Segregating the name of the movie

Name <- web%>%html_nodes("._4rR01T")%>%html_text()
View(Name)

# Price

Deal_Price <- web%>%html_nodes("._1_WHN1")%>%html_text()
View(Deal_Price)
# Ratings

Ratings <- web%>%html_nodes(".gUuXy-")%>%html_text()
View(Ratings)

# Put into a dataframe
# Creating a dataframe

MI.ratings <- data.frame(Name, Deal_Price, Ratings)

# View the dataframe

View(MI.ratings)

# Saving the data

write.csv(MI.ratings, "All_MIratings.csv")

test = read.csv("All_MIratings.csv")
View(test)
