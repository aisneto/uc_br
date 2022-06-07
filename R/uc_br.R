########################################## Projeto de package "uc_br()"###########################################
########################################### Desenvolvido por aisneto #############################################


#cria diretorio temporario e faz download do shapefile
download.data <- function(url, file=tempfile()) {
  download.file(url,destfile = file)
  unzip(file, exdir = tempdir())
}

#lista as unidades de conservação de acordo com o ID
list.uc <- function() {
  if (file.exists(paste(tempdir(),"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = "")) == F) { #verifica & baixa os dados
    download.data("https://metadados.snirh.gov.br/geonetwork/srv/api/records/9407d38f-84d2-48ea-97dd-ee152c493043/attachments/GEOFT_UNIDADE_CONSERVACAO.zip")
  }
  uc_br <- sf::st_read(paste(tempdir(),"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = ""))
  a <- data.frame(uc_br$NOME_UC1, uc_br$ID_UC0)
  colnames(a) <- c("Nome", "ID")
  print(a)
}

#acessa o smart object com base no id
read.uc <- function(id, var = "area") {
  if (file.exists(paste(tempdir(),"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = "")) == F) { #verifica & baixa os dados
    download.data("https://metadados.snirh.gov.br/geonetwork/srv/api/records/9407d38f-84d2-48ea-97dd-ee152c493043/attachments/GEOFT_UNIDADE_CONSERVACAO.zip")
  }
  if (var== "area") {
  uc <- sf::st_read(paste(tempdir(),"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = "")) #le o shapefile das unidades de conservação brasil
  return(uc$geometry[uc$ID_UC0 == id]) #retorna o shapefile do id correspondente
  }
  if (var=="veg"){
    if (file.exists(paste(tempdir(), "\\vege_area\\vege_area.shp", sep="")) == F ) { #verifica & baixa os dados
      download.data("https://geoftp.ibge.gov.br/informacoes_ambientais/vegetacao/vetores/escala_250_mil/versao_2021/vege_area.zip")
    }
    uc <- sf::st_read(paste(tempdir(),"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = "")) #lê o shapefile das uc's brasil
    uc <- uc$geometry[uc$ID_UC0 == id ] #carrega o shapefile do id correspondente
    vg <- sf::st_read(paste(tempdir(), "\\vege_area\\vege_area.shp", sep="")) #lê o shapefile de vegetação brasil
    sf::sf_use_s2(FALSE) #parâmetro para não dar erro na interseção
    int <- sf::st_intersection(vg, uc) #intersecciona os shapefiles
    return(int[22]) #retorna a coluna de legenda
  }
  if (var=="ped"){
    if (file.exists(paste(tempdir(), "\\pedo_area.shp", sep="")) == F ) { #verifica & baixa os dados
      download.data("https://geoftp.ibge.gov.br/informacoes_ambientais/pedologia/vetores/escala_250_mil/versao_2021/pedo_area.zip")
    }
    uc <- sf::st_read(paste(tempdir(),"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = "")) #lê o shapefile das uc's brasil
    uc <- uc$geometry[uc$ID_UC0 == id ] #carrega o shapefile do id correspondente
    pd <- sf::st_read(paste(tempdir(), "\\pedo_area.shp", sep="")) #lê o shapefile de pedologia brasil
    sf::sf_use_s2(FALSE) #parâmetro para não dar erro na interseção
    int <- sf::st_intersection(pd, uc) #intersecciona os shapefiles
    return(int[6]) #retorna a coluna de legenda
  }
  if (var=="geomor"){
    if (file.exists(paste(tempdir(), "\\geom_area.shp", sep="")) == F ) { #verifica & baixa os dados
      download.data("https://geoftp.ibge.gov.br/informacoes_ambientais/geomorfologia/vetores/escala_250_mil/versao_2021/geom_area.zip")
    }
    uc <- sf::st_read(paste(tempdir(),"\\GEOFT_UNIDADE_CONSERVACAO.shp", sep = "")) #lê o shapefile das uc's brasil
    uc <- uc$geometry[uc$ID_UC0 == id ] #carrega o shapefile do id correspondente
    geo <- sf::st_read(paste(tempdir(), "\\geom_area.shp", sep="")) #lê o shapefile de geomorfologia brasil
    sf::sf_use_s2(FALSE) #parâmetro para não dar erro na interseção
    int <- sf::st_intersection(geo, uc) #intersecciona os shapefiles
    return(int[18]) #retorna a coluna de legenda
  }
}


