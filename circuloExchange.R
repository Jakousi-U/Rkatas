fileName = "data/nombres.txt"
nombres <- read.csv(file = fileName, header = FALSE)
if(nrow(nombres) > 0){
  circulo <- sample(1:nrow(nombres))
  for(i in 1:length(circulo)){
    if(i == length(circulo)){
      print(paste(nombres[circulo[i],1],"-->",nombres[circulo[1],1]))
    }else{
      print(paste(nombres[circulo[i],1],"-->",nombres[circulo[i+1],1]))
    }
  }
}
