# BC Liquors Shiny App

Welcome to my first exploration of a shiny app! [View my shiny app here](http://127.0.0.1:3319)

This repository is for assignment 3 of STAT545B at UBC. 

For this assignment I chose to do Option A of adding features to our BC Liquor app.

I added three new features to the "basic" BC Liquor app that we designed in class: 

- I added an image to the UI of the BC Liquor Store logo as it makes the webpage more visually appealing. I also reduced the size of this image to take up an appropriate amount of the webpage. 

- I added two tabs: one with the plot and one with the table. This helps organize the webpage.

- I used the DT package to turn the static table into an interactive table with a search bar and sorting options. This helps the user look for exactly what they want. For example, if they wanted to sort wine by the cheapest cost, they would now be able to. 


## Repository Contents
- www folder contains the link to the image I used
- app.R contains the code for the shiny app



### Data
The BC Liquor data set was pulled from: https://github.com/daattali/shiny-server/blob/master/bcl/data/bcl-data.csv
