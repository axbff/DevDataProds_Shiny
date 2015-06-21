library(shiny)

shinyServer(function(input, output){
  ds = reactive(get(input$dataset))
  
  cbList = reactive({
    
    cbList = list()
  
    for(i in names(ds())) cbList[[i]] = i
    
    cbList
  })
  
  output$vars_list = renderUI(
    checkboxGroupInput("vars_list",
                       "Available Variables:",
                       cbList(),
                       cbList(),
                       TRUE)
  )
  
  hide_plot = FALSE
  
  observe({
    input$dataset
    
    hide_plot = TRUE
    
    output$plotDataset = renderUI(div(""))
  })
  
  observe({
    input$plotButton
    
    vars = isolate(input$vars_list)
    d = isolate(ds())
    dn = isolate(input$dataset)
    
    if(length(vars) > 0 && !hide_plot)
      output$plotDataset = renderPlot(plot(d[vars], main = dn))
    else
      output$plotDataset = renderUI(div(""))
    
  })
})