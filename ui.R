library(shiny)

UiPanel = tabPanel(
  "Explore",
  fluidRow(
    column(2, selectInput("dataset", "Choose Dataset:", datasetsList)),
    column(3, br(), actionButton("plotButton","Plot Selected Variables")),
    column(7, htmlOutput("vars_list"))
    ),
  plotOutput("plotDataset")
)

DocPanel = tabPanel("Help & Documentation",
  includeHTML("help.html")
)

navbarPage("Dataset Explorer", UiPanel, DocPanel)