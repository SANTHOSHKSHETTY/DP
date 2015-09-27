shinyUI(
  
  
  navbarPage("SpeciesPredictionApp",
                   tabPanel("Select Model",
                            sidebarLayout(
                              sidebarPanel(
                                radioButtons("Model", "Select Model",
                                             c("Random Forest"="rf", "Naive Bayes"="nb")
                                )
                              ),
                              mainPanel(
                                fluidRow(
                                  # sliders
                                  column(4, sliderInput("slength", "Sepal Length:",
                                                        min = 4.0, max = 8.0, value = 5.1,step=0.2),
                                         p(  strong("Sepal Length: "),
                                             textOutput("oslength",  inline = TRUE)
                                         )  ),
                                  
                                  column(4, sliderInput("swidth", "Sepal Width:",
                                                        min = 2.0, max = 5.0, value = 3.5,step=0.2),
                                         p(strong("Sepal Width: "),
                                           textOutput("oswidth", inline = TRUE))),
                                  
                                  column(4, sliderInput("plength", "Petal Length:",
                                                        min = 1.0, max = 7.0, value = 1.4,step=0.2),
                                         p(strong("Petal Length: "),
                                           textOutput("oplength",  inline = TRUE))),
                                  
                                  column(4, sliderInput("pwidth", "Petal width:",
                                                        min = 0.1, max = 2.5, value = 0.2),
                                         p(strong("Petal Width: "),
                                           textOutput("opwidth",inline = TRUE))),
                                  style = "opacity: 0.92; z-index: 100;",
                                  
                                  actionButton("goButton", "Predict"),
                                  p('Predicted Species'),
                                  textOutput('predict')
                                  )
                                
                                
                                
                                
                                
                              ) 
                              
                            )
                            
                   )  
             
                   ,
                   tabPanel("Species Data Analysis",
                            
                            sidebarLayout(
                              sidebarPanel(
                                verbatimTextOutput("data")
                                ),
                              
                              mainPanel(
                                plotOutput("plot")
                              )    
                            )
                            
                            
                   ),
                  tabPanel("Random Forest Accuracy",
                      verbatimTextOutput("rf")
                  ),
                 tabPanel("Naive Bayes Accuracy",
                      verbatimTextOutput("nb")
                 ),
                  tabPanel("Predict Species",
                      verbatimTextOutput("ps")
                  )
             
             
                         
                              
  )  

)  

