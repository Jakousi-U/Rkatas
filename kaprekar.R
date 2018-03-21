kaprekar <- function(x,printSteps=FALSE){
  endnumber <- x
  steps <- c()
  aux <- as.numeric(strsplit(as.character(x), "")[[1]])
  if(length(aux)==4){
    while(endnumber != 6174){
      mayor <- aux[order(aux,decreasing = TRUE)]
      if(length(aux)==4){
        mayor <- as.numeric(paste(mayor, collapse = ""))
      }else if(length(aux)==3){
        mayor <- as.numeric(paste(mayor, collapse = "")) * 10
      }else if(length(aux)==2){
        mayor <- as.numeric(paste(mayor, collapse = "")) * 100
      }else if(length(aux)==1){
        mayor <- as.numeric(paste(mayor, collapse = "")) * 1000
      }
      menor <- aux[order(aux)]
      menor <- as.numeric(paste(menor, collapse = "")) 
      endnumber <- mayor - menor
      if(endnumber==0){
        break
      }
      aux <- aux <- as.numeric(strsplit(as.character(endnumber), "")[[1]])
      steps <- c(steps,paste(mayor,"-",menor,"=",endnumber))
    }
    if(printSteps){
      for(line in steps){
        print(line)
      }
    }
    print(paste(x,"go to",endnumber))
  }else{
    print("Please insert a 4 digit number")
  }
}
