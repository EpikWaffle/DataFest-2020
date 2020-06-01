library(shiny)

final.model = function(a,b,c,d,e,f,g,h,i,j) {
  x = 8.67591 + .03766*a + .76572*b -
  .23387*c + .26140*d + .09752*e - .02285*f -
  .14872*g + .03830*h + .39242*i - .64805*j
  
  return(round(x, 3))
}

ui = fluidPage(
  
  titlePanel("Mental Health Predictor"),
  
  helpText("Manipulate the following sliders to receive your predicted mental health score."),
  
  sliderInput(inputId = "q1", 
              label = "Rate your frequency of social interaction with others excluding family
              from 0 (no interaction) to 10 (very frequent interaction).", 
              value = 0, min = 0, max = 10),
  
  sliderInput(inputId = "q2", 
              label = "Rate your physical health from 0 (no symptoms, healthy) to 10 
              (many symptoms/severe pre-existing condition (diabetes, respiratory disease, etc.)).", 
              value = 0, min = 0, max = 10),
  
  sliderInput(inputId = "q3", 
              label = "Rate how your daily activities have been affected by the pandemic from 
              0 (unaffected) to 10 (severely altered). (i.e. school closings, cancellation of 
              health appointments/testing, travel bans).", 
              value = 0, min = 0, max = 10),
  
  sliderInput(inputId = "q4", 
              label = "Rate how the pandemic has negatively affected your financial security/personal finance 
              from 0 (no impact) to 10 (severely impacted). (i.e. loss of savings, taken loans, sold personal
              assets, borrowing money from friends/family, income).", 
              value = 0, min = 0, max = 10),
  
  sliderInput(inputId = "q5", 
              label = "Describe your current living area (1 - rural, 2 - suburban, 3 - urban).", 
              value = 1, min = 1, max = 3),
  
  sliderInput(inputId = "q6", 
              label = "Choose your region or the one most similar to your own.
              (1 - New England, 2 - Mid-Atlantic, 3 - East North Central, 4 - West North Central, 
              5 - South Atlantic, 6 - East South Central, 7 - West South Central, 8 - Mountain, 9 - Pacific).", 
              value = 1, min = 1, max = 9),
  
  sliderInput(inputId = "q7", 
              label = "Choose your household size (1 - one, 2 - two, 3 - three, 4 - four, 
              5 - five, 6 - six or more).", 
              value = 1, min = 1, max = 6),
  
  sliderInput(inputId = "q8", 
              label = "What is the highest level of education you have completed. (1 - no high school diploma
              , 2 - high school graduate, 3 - some college, no degree, 4 - associate, 5 - bachelors
              , 6 - masters, 7 - professional or doctorate).", 
              value = 1, min = 1, max = 7),
  
  sliderInput(inputId = "q9", 
              label = "What is your gender. (0 - other, 1 - male, 2 - female).", 
              value = 0, min = 0, max = 2),
  
  sliderInput(inputId = "q10", 
              label = "Enter your age group. (1: 18-24, 2: 25-34, 3: 35-44, 4: 45-54, 5: 55-64, 6: 65-74, 7: 75+).", 
              value = 1, min = 1, max = 7),
  
  textOutput("score")
)

server = function(input, output) {
  output$score = renderText({
    paste(c("Mental Health Score:", final.model(input$q1, input$q2, input$q3, input$q4, input$q5,
                                               input$q6, input$q7, input$q8, input$q9, input$q10)), collapse = " ")
  })
}

shinyApp(ui = ui, server = server)