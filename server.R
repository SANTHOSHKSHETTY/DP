


library(shiny)
d<<-summary(iris)

mod.nb<<-naiveBayes(iris[,1:4],iris[,5])
pred.nb<<-predict(mod.nb,iris[,-5])
nbaccuracy<<-confusionMatrix(pred.nb,iris[,5])

mod.rf<<-train(Species~.,method='rf',data=iris)
pred.mod.rf<<-predict(mod.rf,newdata=iris)   # provide new data
rfaccuracy<<-confusionMatrix(pred.mod.rf,iris[,5])      # predicted versus actual 

ndata<<-iris[1,1:4]

shinyServer(
  
  function(input, output) {
    
   
    
    output$oslength <- renderText({input$slength})
    output$oswidth <- renderText({input$swidth})
    output$oplength <- renderText({input$plength})
    output$opwidth <- renderText({input$pwidth})
    

   
    #output$predict <- renderText({ p})
    #output$ps<-renderPrint({p})  
    output$predict <- renderText({ 
      input$goButton
      isolate( {
       
        ndata[1,1]<-input$slength
        ndata[1,2]<-input$swidth
        ndata[1,3]<-input$plength
        ndata[1,4]<-input$pwidth
        
        if(input$Model=='rf'){ p<-as.character(predict(mod.rf,newdata=ndata) )  }
        if(input$Model=='nb'){ p<-as.character(predict(mod.nb,newdata=ndata)  ) }
        
      })
      
    })
    
    output$ps <- renderText({ 
      input$goButton
      isolate( {
        
        ndata[1,1]<-input$slength
        ndata[1,2]<-input$swidth
        ndata[1,3]<-input$plength
        ndata[1,4]<-input$pwidth
        
        if(input$Model=='rf'){ p<-as.character(predict(mod.rf,newdata=ndata) )  }
        if(input$Model=='nb'){ p<-as.character(predict(mod.nb,newdata=ndata)  ) }
        
      })
      
    })
    
   
    
    output$plot <- renderPlot({
      pairs( iris[1:4],main="Iris Data red=setosa,green=versicolor,blue=virginica",
             pch=21,bg=c('red','green','blue')[unclass(iris$Species)])
    })
    output$data <- renderPrint({d})
    output$rf <- renderPrint({rfaccuracy})
    output$nb <- renderPrint({nbaccuracy})
    
    
  }  # function
  
  
  
  
)