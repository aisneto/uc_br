# uc_br

# Introdução
O pacote "ucbr" foi criado para facilitar a integração de dados geoespaciais acerca das Unidades de Conservação (UC's) brasileiras na linguagem de programação R. O pacote acessa e faz o download de bancos de dados oficiais do Instituto Brasileiro de Geografia e Estatística (IBGE), e os acessa no ambiente R na forma de <i> simple features </i>; um formato simplificado de dados espaciais viabilizado pelo pacote "sf". Atualmente, "ucbr" pode carregar dados acerca da área, pedologia, vegetação e geomorfologia.  

# Uso
A principal função do pacote é a "read.uc(id, var)". O argumento "id" refere-se ao código de identificação da Unidade de Conservação atríbuido pelo IBGE. O segundo argumento, "var", refere-se ao conjunto de dados geoespaciais a ser retomado. O argumento "area" refere-se a área total da UC;  O argumento "veg" refere-se a fitofisionomia da UC; o argumento "ped" refere-se a pedologia da UC; e o argumento "geom" refere-se a geomorfologia da UC.

# Referências
IBGE. "Manual técnico da vegetação brasileira. 2ª edição revisada e ampliada." (2012). <br>
IBGE. "Manual Técnico de Geomorfologia. Segunda edição". Rio de Janeiro: IBGE, 2009. 182p. <br>
IBGE. Manuais Técnicos. "Manual técnico de pedologia. 2º edição." Rio de Janeiro (2007). <br>
