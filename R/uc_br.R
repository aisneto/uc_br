########################################## Projeto de package 'uc_br()'###########################################
########################################### Desenvolvido por aisneto #############################################


#cria diretorio temporario e faz download do shapefile
download.data <- function(url, file=tempfile()) {
  download.file(url,destfile = file)
  unzip(file, exdir = tempdir())
}
#lista as unidades de conservação de acordo com o ID
list.uc <- function() {
  if (file.exists(file.path(tempdir(),'GEOFT_UNIDADE_CONSERVACAO.shp')) == F) { #verifica & baixa os dados
    download.data('https://metadados.snirh.gov.br/geonetwork/srv/api/records/9407d38f-84d2-48ea-97dd-ee152c493043/attachments/GEOFT_UNIDADE_CONSERVACAO.zip')
  }
  uc_br <- sf::st_read(file.path(tempdir(),'GEOFT_UNIDADE_CONSERVACAO.shp'))
  a <- data.frame(uc_br$NOME_UC1, uc_br$ID_UC0)
  colnames(a) <- c('Nome', 'ID')
  print(a)
}
#acessa o smart object com base no id
read.uc <-  function(id, var){
  url <- c(area = 'https://metadados.snirh.gov.br/geonetwork/srv/api/records/9407d38f-84d2-48ea-97dd-ee152c493043/attachments/GEOFT_UNIDADE_CONSERVACAO.zip',
           veg ='https://geoftp.ibge.gov.br/informacoes_ambientais/vegetacao/vetores/escala_250_mil/versao_2021/vege_area.zip',
           ped ='https://geoftp.ibge.gov.br/informacoes_ambientais/pedologia/vetores/escala_250_mil/versao_2021/pedo_area.zip',
           geom ='https://geoftp.ibge.gov.br/informacoes_ambientais/geomorfologia/vetores/escala_250_mil/versao_2021/geom_area.zip')
  path <- c(area = file.path(tempdir(), 'GEOFT_UNIDADE_CONSERVACAO.shp'),
            veg = file.path(tempdir(), 'vege_area', 'vege_area.shp'),
            ped = file.path(tempdir(),'GEOFT_UNIDADE_CONSERVACAO.shp'),
            geom =file.path(tempdir(), 'geom_area.shp'))
  if(var != 'veg'& var != 'ped' & var !='geom' & var != 'area'){
    stop('Variável inválida')
  }
  if(file.exists(path['area']) == F) {
    download.data(url['area'])
  }
  if(var=='area') {
    uc <- sf::st_read(path['area'])
    if(id %in% uc$ID_UC0 == F){
      stop('ID não encontrado')
    }
    return(uc$geometry[uc$ID_UC0 == id])
  }
  else if(var == 'veg'| var == 'ped'|var =='geom'){
    if(file.exists(path[var]) == F){
      download.data(url[var])
    }
    uc <- sf::st_read(path['area'])
    uc <- uc$geometry[uc$ID_UC0 == id ]
    vr <- sf::st_read(path[var])
    sf::sf_use_s2(FALSE)
    int <- sf::st_intersection(vr, uc)
    return(int['legenda'])
  }
}