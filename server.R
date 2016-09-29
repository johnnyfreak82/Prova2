library(maptools)
library(xlsx)
library(shiny)

regioni=readShapeSpatial("reg2011_g.shp")


comuni=readShapeSpatial("com2011_g.shp")

dataset<-data.frame(Ente=rep("Deplazio",25),Anno=rep(2013,25),Area=c("Milano","Torino","Genova","Padova","Trieste","Venezia","Treviso","Rovigo","Bologna","Modena","Parma","Reggio nell'Emilia","Ferrara","Piacenza","Firenze","Rimini","Pisa","Ancona","Roma","Napoli","Palermo","Bari","Taranto","Cagliari","Brindisi"),Titolo=rep("25 città italiane",25))





shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot




  output$distPlot <- renderPlot({

    if (input$Ente != "Tutti") {
      dataset <- dataset[dataset$Ente == input$Ente,]
    }
    if (input$Anno != "Tutti") {
      dataset <- dataset[dataset$Anno == input$Anno,]
    }
    if (input$Area != "Tutte") {
      dataset <- dataset[dataset$Area == input$Area,]
    }
    


  
plot(regioni,height=2000,width=2000)



selezionati<-comuni[comuni$NOME_COM %in% unique(dataset$Area),]
points(coordinates(selezionati),col="cadetblue3",pch=16)



  })
})