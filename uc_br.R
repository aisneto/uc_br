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