library(shiny)
library(ggplot2)
library(dplyr)
library(shinythemes)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  #Adding the cosmo theme from shinythemes to enhance the UI
  theme = shinytheme("cosmo"),
  #I added an image to the UI of the BC Liquor Store logo as it makes the webpage more visually appealing. I also reduced the size of this image to take up an appropriate amount of the webpage.
  img(src = "logo.png", height="50%", width="50%"),
  #Adding a title
  titlePanel("All about BC Liquor Store products!"),
  #Adding a border
  tags$hr(style="border-color: red;"),
  #Adding a header for info about the app with an image of clinking glasses
  h5("On this shinyapp you can filter the BC Liquor Store data to find the products you want based on liquor type, alcohol content, price, and more. You can visualize your options using the histogram and scatter plot tabs as well. Have fun exploring!", img(src = "liquor.png", height="5%", width="5%")),
  tags$hr(style="border-color: red;"),
  #Laying out page with panels
   sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
      #I changed the radiobuttons into check boxes to select multiple features at once
      checkboxGroupInput("typeInput", "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      uiOutput("countryOutput"),
    #Displaying number of results
     textOutput("NumberofResults")
    ),
    mainPanel(
      ##I added three tabs: one with the table, one with a histogram, one with a scatterplot. This helps organize the webpage.
      tabsetPanel(
        tabPanel("Table", DT::dataTableOutput("results")), #I replaced TableOutput() with DT:dataTableOutput() to include the new interactive table I made in the server
        tabPanel("Histogram", plotOutput("histogram")),
        tabPanel("Scatter Plot", plotOutput("scatterplot"))
      )
    )
  )
)

server <- function(input, output) {
  output$countryOutput <- renderUI({
    selectInput("countryInput", "Country",
                sort(unique(bcl$Country)),
                selected = "CANADA")
  })

  filtered <- reactive({
    if (is.null(input$countryInput)) {
      return(NULL)
    }

    bcl %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$countryInput
      )
  })

  output$histogram <- renderPlot({
    if (is.null(filtered())) {
      return()
    }
    ggplot(filtered(), aes(Alcohol_Content)) +
      geom_histogram()
  })

  output$results <- DT::renderDataTable({ #I replaced the renderTable() with DT:renderDataTable() to turn our static table into an interactive one. This added a search bar and sorting capabilities.
    filtered()
  })
    output$scatterplot <- renderPlot({filtered() %>%
    ggplot(aes(Alcohol_Content, Price)) + geom_point(size=3, aes(color= Subtype)) + scale_colour_discrete("Subtype")
  })
    output$NumberofResults <- renderText({
      paste0("Results: ", nrow(filtered())) #I added the number of results to be shown

    })
}

shinyApp(ui = ui, server = server)
