\name{read.uc}
\alias{read.uc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Unidades de conservação do Brasil
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
O pacote "ucbr" foi criado para facilitar a integração de dados geoespaciais acerca das Unidades de Conservação (UC's) brasileiras na linguagem de programação R. O pacote acessa e faz o download de bancos de dados oficiais do Instituto Brasileiro de Geografia e Estatística (IBGE), e os acessa no ambiente R na forma de <i> simple features </i>; um formato simplificado de dados espaciais viabilizado pelo pacote "sf". Atualmente, "ucbr" pode carregar dados acerca da área, pedologia, vegetação e geomorfologia.
}
\usage{
read.uc(id, var)
list.uc()
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{var}{'area', 'ped', 'geom', 'veg'
%%     ~~Describe \code{x} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
IBGE. "Manual técnico da vegetação brasileira. 2ª edição revisada e ampliada." (2012). <br>
IBGE. "Manual Técnico de Geomorfologia. Segunda edição". Rio de Janeiro: IBGE, 2009. 182p. <br>
IBGE. Manuais Técnicos. "Manual técnico de pedologia. 2º edição." Rio de Janeiro (2007). <br>

}
\author{
%%  ~~who you are~~
Antonio I. S. Neto - Programa de Pós-Graduação em Ecologia e Conservação da Biodiversidade
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
