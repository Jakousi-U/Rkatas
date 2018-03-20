goToOne <- function(x, n = 1000, printRes = FALSE){
  road <- c(x)
  steps <- 0
  aux <- x
  while(steps < n){
    steps <- steps + 1
    if(aux %% 2 == 0){
      aux <- aux /2
    }else{
      aux <- aux*3 + 1
    }
    road <- c(road, aux)
    if(aux == 1){
      break
    }
  }
  print(paste("From",x,"to 1 in",steps))  
  if(printRes){
    print(road)
    plot(road,type="o")
  }
}
