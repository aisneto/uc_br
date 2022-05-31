###################################### Projeto de package "uc_br()"###################################
########################################Desenvolvido por aisneto #####################################

#Carrega packages necessárias
library(sf)
install.packages("sf")

#Cria diretorio temporario e faz download do shapefile

file <- tempfile()
dir <- tempdir()
teste <- download.file("https://metadados.snirh.gov.br/geonetwork/srv/api/records/9407d38f-84d2-48ea-97dd-ee152c493043/attachments/GEOFT_UNIDADE_CONSERVACAO.zip",
                       destfile = file)
unzip(file, exdir = dir)
list.files(dir)
setwd(dir)
x <- st_read("GEOFT_UNIDADE_CONSERVACAO.shp")

# Lista as unidades de conservação de acordo com o ID

list.uc <- function() {
  a <- data.frame(x$NOME_UC1, x$ID_UC0)
  colnames(a) <- c("Nome", "ID")
  print(a)
  
}

# Acessa o smart object com base no id

read.uc <- function(id) {
  x$geometry[x$ID_UC0 == id ]
}



