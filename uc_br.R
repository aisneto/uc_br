########################################## Projeto de package "uc_br()"###########################################
########################################### Desenvolvido por aisneto #############################################


#Cria diretorio temporario e faz download do shapefile
download.data <- function(url, exdir=tempdir(), file=tempfile()) {
  download.file(url,destfile = file)
  unzip(file, exdir = exdir)
}

# Lista as unidades de conservação de acordo com o ID
list.uc <- function(exdir=tempdir()) {
  if (file.exists(paste(exdir,"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = "")) == F) { #verifica & baixa os dados
    uc_br <- download.data("https://metadados.snirh.gov.br/geonetwork/srv/api/records/9407d38f-84d2-48ea-97dd-ee152c493043/attachments/GEOFT_UNIDADE_CONSERVACAO.zip")
  }
  uc_br <- sf::st_read(paste(exdir,"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = ""))
  a <- data.frame(uc_br$NOME_UC1, uc_br$ID_UC0)
  colnames(a) <- c("Nome", "ID")
  print(a)
}

# Acessa o smart object com base no id
read.uc <- function(id, exdir=tempdir()) {
  if (file.exists(paste(exdir,"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = "")) == F) { #verifica & baixa os dados
    uc_br <- download.data("https://metadados.snirh.gov.br/geonetwork/srv/api/records/9407d38f-84d2-48ea-97dd-ee152c493043/attachments/GEOFT_UNIDADE_CONSERVACAO.zip")
  }
  uc_br <- sf::st_read(paste(exdir,"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = ""))
  uc_br$geometry[uc_br$ID_UC0 == id ]
}

