# ********************************************************** #
# * Autor: Jakousi Urbina                                  * #
# * Fecha: 2018.11.25                                      * #
# * Este script muestra distintos datos relacionado con    * #
# * los resultados de Junior Eurovision Song Contest:      * #
# *   1. Relación del top 3 con el orden inverso de        * #
# *      participación en cada año (hipótesis: se obtiene  * #
# *      mejores resultados entre más al final del evento  * #
# *      se canta).  * #
# ********************************************************** #

# Se carga el api para leer Google Sheets
library(googlesheets)
# Hoja con los datos de puntos de Junior Eurovision Song Contest
# Es pública, no requiere autentificarse
jesc <- gs_url("https://docs.google.com/spreadsheets/d/1OegoDmXh-TMS23DvoRO4AtWIIE_DNjUlNRmyBhABnrI", lookup = FALSE)
# Descarga de datos
gsjesc <- gs_read(ss=jesc, ws = 1, col_names  =TRUE)
# Transformación a Data Frame
dfjesc <- as.data.frame(gsjesc)
# se calcula la columna de orden inverso
dfjesc$invDraw <- dfjesc$NumCountries - dfjesc$Draw + 1
# Se calcula el porcentaje de puntos obtenidos respecto a puntos disponibles
dfjesc$porcentaje <- dfjesc$Points / dfjesc$Max
# Se prepara un vector de color para los puntos de la gráfica
dfjesc$color <- "lightgray"
# Se prepara un vector de símbolos para los puntos de la gráfica
dfjesc$pch <- 20
# Se les asigna diferente y color a los top 3
dfjesc[dfjesc$Place == 1,]$color <- "gold"
dfjesc[dfjesc$Place == 1,]$pch <- 16
dfjesc[dfjesc$Place == 2,]$color <- "seashell4"
dfjesc[dfjesc$Place == 2,]$pch <- 16
dfjesc[dfjesc$Place == 3,]$color <- "saddlebrown"
dfjesc[dfjesc$Place == 3,]$pch <- 16
# Se gráfica
plot(dfjesc$Year, dfjesc$invDraw, col=dfjesc$color, pch=dfjesc$pch, xaxt="n", xlab = "Year", ylab = "Inverse running order")
# Se agrega leyenda
legend("top", legend=c("First", "Second", "Third", "Others"), col=c("gold", "seashell4","saddlebrown","lightgray"), pch=c(16,16,16,20), cex=0.8)
# Se coloca cada año en el eje x
axis(1, at = seq(2003, 2018, by = 1), las=2)