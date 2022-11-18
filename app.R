library(shiny)
library(ggplot2)
library(dplyr)

bcl <- read.csv("~/Desktop/bcl-data.csv")

ui <- fluidPage(
  img(src = "logo.png", height="50%", width="50%"), #I added an image to the UI of the BC Liquor Store logo as it makes the webpage more visually appealing. I also reduced the size of this image to take up an appropriate amount of the webpage.
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
      radioButtons("typeInput", "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      uiOutput("countryOutput")
    ),
    mainPanel(
      tabsetPanel( #I added two tabs: one with the plot, one with the table. This helps organize the webpage.
        tabPanel("Table", DT::dataTableOutput("results")), #I replaced TableOutput() with DT:dataTableOutput() to include the new interactive table I made in the server
        tabPanel("Plot", plotOutput("coolplot"))
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

  output$coolplot <- renderPlot({
    if (is.null(filtered())) {
      return()
    }
    ggplot(filtered(), aes(Alcohol_Content)) +
      geom_histogram()
  })

  output$results <- DT::renderDataTable({ #I replaced the renderTable() with DT:renderDataTable() to turn our static table into an interactive one. This added a search bar and sorting capabilities.
    filtered()
  })
}

shinyApp(ui = ui, server = server)
