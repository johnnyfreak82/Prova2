library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Censimento documenti EpiAmbnet"),

  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
        selectInput("Ente",
                    "Ente:",
                    c("Tutti",
                      unique(as.character(dataset$Ente))))
    ),
    column(4,
        selectInput("Anno",
                    "Anno di pubblicazione:",
                    c("Tutti",
                      unique(as.character(dataset$Anno))))
    ),
    column(4,
        selectInput("Area",
                    "Area di studio:",
                    c("Tutte",
                      unique(as.character(dataset$Area))))
    )
  ),

 # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)