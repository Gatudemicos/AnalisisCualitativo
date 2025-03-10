####                        MODIFICACIÓN DE get_sentiment() DE TIDYTEXT                 ####
#                                 Desarrollada y adaptada por                              #
#                                  José Manuel Fradejas Rueda                              #

#  Proyecto 7PartidasDigital "Edición crítica digital de las Siete Partidas de Alfonso X"  #
#        Proyecto financiado por el MINECO, referencia FFI2016-75014-P AEI-FEDER, EU       #
#                Universidad de Valladolid -- IP José Manuel Fradejas Rueda                #
#                              https://7partidas.hypotheses.org/                           #
#                             https://github.com/7PartidasDigital                          #
#                         Este material se distribuye con una licencia                     #
#                                            MIT                                           #
#                                         v. 1.0.0                                         #

# Nota:
# 
# Exige cargar previamente load("datos_esp-small.rda") que es un dataset que contiene
# los diccionarios de sentimiento traducidos, modificados y adapatados al español para
# el análisis de sentimientos (Sentiment Analisys) basado en el paquete TIDYTEXT.
# Es un tibble 15452 x 4 con las columnas: palabra - sentimiento - lexicon - valor.
# Este dataset también incluye un listado de 765 palabras vacías (stopwords) del español
# (vacias_esp).

# Existe una nueva versión de datos_esp.rda con todos los diccionarios y se ha duplicado
# el número de elementos, ya que es una tibble de 30555 x 4.


get_sentiments <- function(lexicon = c("nrc", "bing", "AFINN", "syuzhet", "uva")) {
  data(sentimientos, package= NULL, envir = environment())
  lex <- match.arg(lexicon)
  
  if (lex == "afinn") {
    # turn uppercase: reverse compatibility issue
    lex <- "AFINN"
  }
  
  ret <- sentimientos %>%
    dplyr::filter(lex == lexicon) %>%
    dplyr::select(-lexicon)
  
  if (lex == "AFINN") {
    ret$sentimiento <- NULL
  } else if (lex == "syuzhet") {
    ret$sentimiento <- NULL
  } else {
    ret$valor <- NULL
  }
  ret
}