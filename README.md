# BC Liquors Shiny App

Welcome to my first exploration of a shiny app! [View my shiny app here](https://jg1121.shinyapps.io/assignment-b3-jg1121/)

This repository is for assignments 3 and 4 of STAT545B at UBC. 

## Asignment 3

For this assignment I chose to do Option A of adding features to our BC Liquor app.

I added three new features to the "basic" BC Liquor app that we designed in class: 

- I added an image to the UI of the BC Liquor Store logo as it makes the webpage more visually appealing. I also reduced the size of this image to take up an appropriate amount of the webpage. 

- I added two tabs: one with the plot and one with the table. This helps to organize the webpage.

- I used the DT package to turn the static table into an interactive table with a search bar and sorting options. This helps the user look for exactly what they want. For example, if they wanted to sort wine by the cheapest cost, they would now be able to. 

## Assignment 4
For this assignment, I built off of the last version of the website from assignment 3 to improve the quality and overall design of the app.

- I added the cosmo theme from shiny themes to the UI to enhance the appearance of the page 

- I added a title panel to the UI

- I added a description of the website for users to read with borders and an image of clinking glasses.

- I converted the radiobuttons feature into checkboxes for users to choose multiple options

- I added the number of results to be shown when the user filters for their selection

- I added a scatterplot (in a new tab) of alcohol content vs price, colored by alcohol subtype, for users to visualize their options within their selection.


### Repository Contents
- rsconnect/shinyapps.io/jg1121 contains the published shiny app information
- www folder contains the link to the images I used
- app.R contains the code for the shiny app
- bcl-data.csv is the csv data file used in the making of the app


#### Data
The BC Liquor data set was pulled from: https://github.com/daattali/shiny-server/blob/master/bcl/data/bcl-data.csv
