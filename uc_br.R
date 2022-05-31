########################################## Projeto de package "uc_br()"###########################################
########################################### Desenvolvido por aisneto #############################################


#Cria diretorio temporario e faz download do shapefile
download.data <- function() {
  file <- tempfile()
  tempdir <- tempdir()
  download.file("https://metadados.snirh.gov.br/geonetwork/srv/api/records/9407d38f-84d2-48ea-97dd-ee152c493043/attachments/GEOFT_UNIDADE_CONSERVACAO.zip",
                destfile = file)
  unzip(file, exdir = tempdir)
}

# Lista as unidades de conservação de acordo com o ID
list.uc <- function() {
  tempdir <- tempdir()
  if (file.exists(paste(tempdir,"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = "")) == F) {
    uc_br <- download.data()
  }
  uc_br <- sf::st_read(paste(tempdir,"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = ""))
  a <- data.frame(uc_br$NOME_UC1, uc_br$ID_UC0)
  colnames(a) <- c("Nome", "ID")
  print(a)
  
}

# Acessa o smart object com base no id
read.uc <- function(id) {
  tempdir <- tempdir()
  if (file.exists(paste(tempdir,"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = "")) == F) {
    uc_br <- download.data()
  }
  uc_br <- sf::st_read(paste(tempdir,"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = ""))
  uc_br$geometry[uc_br$ID_UC0 == id ]
}
