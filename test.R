#=======================
# Modulo: Data Analytics
# Autor: Edi Mendoza
# 02/21/2014
#=======================

##########################
# 1. Herramientas Basicas#
##########################

#-----------------------
# Ejecucion
#-----------------------
# Ejecucion en linea: ctr + enter
# Ejecucion hasta el cursor: crtl + alt + b

nombres <- c("Edi", "Bryan", "Harvey","Luisa")
edades <- c(29.5, 35.24, 28,12, 45.13)
universidad <- c("UNAM", "IPN", "UCOL", "UVEG")
titulo <- c(FALSE, TRUE, F, T)

help(c)

#----------------
# Area de Trabajo
#----------------
getwd()
setwd("C:/Working/dir/here/with/regular/slashes")
getwd()

# opcion 2:
setwd("C:\\Working\\dir\\here\\with\\regular\\slashes")


#-------------------------
# listar todas las variables
#-------------------------

ls()
# [1] "edades"      "list"        "nombres"     "titulo"      "universidad"

ls.str()
# edades :  num [1:5] 29.5 35.2 28 12 45.1
# nombres :  chr [1:4] "Edi" "Bryan" "Harvey" "Luisa"
# titulo :  logi [1:4] FALSE TRUE FALSE TRUE
# universidad :  chr [1:4] "UNAM" "IPN" "UCOL" "UVEG"

objects()
# sinonimo de ls()
# [1] "edades"      "nombres"     "titulo"      "universidad"

objects.str()
# returns error
# Error in objects.str() : could not find function "objects.str"

#-------------------------
# eliminacion de objetos
#-------------------------

rm(EDADES)
# returns
# Warning message:
# In rm(EDADES) : object 'EDADES' not found

# group rm
rm(edades, nombres)

# rm automatizado, lista objets de ls() y les da rm
rm(list=ls())

##########################
# 2. Mecanismos de ayuda #
##########################

# estos dos son lo mismo
help(matrix)
?rm

#ventana externa con informacion de la libreria
library(help = "ggplot2")

##############################
# 3. Instalacion de Paquetes #
##############################
# instalacion
library(ggplot2)
# Error in library(ggplot2) : there is no package called ‘ggplot2’
# intentamos cargar ggplot2, pero no lo tenemos instalado

install.packages("ggplot2")
# package 'ggplogt2' successfully unpacked and MD5 sums checked
# packages have their own dependencies, make sure you have the most updated
# el paquete solo se instala una vez, no lo tienes que instalar cada vez que
# uses o crees algun programa, script en R

# carga de paquete:
library(ggplot2)
# el comando no retorna nada, se agrega automaticamente a tu ambiente de R
# cada vez que abras R:
#   - No necesitas instalar un paquete
#   - Si necesitas cargar el paquete

# verificacion
search()
# Gives a list of attached packages (see library), and R objects, usually data.frames.

# > search()
# [1] ".GlobalEnv"        "package:ggplot2"   "tools:rstudio"     "package:stats"     "package:graphics"  "package:grDevices"
# [7] "package:utils"     "package:datasets"  "package:methods"   "Autoloads"         "package:base"

# Todos estos son paquetes standard? no todos, casi todos.
# - **.GlobalEnv** - global environment, where user-defined objects (variables, functions, etc.) live. This is always present
# - **package:base** - The core base package, which contains fundamental R functions (e.g., print(), sum(), etc.).
# 
# All of these are **standard R packages** that come with every R installation (part of the "base R" system).  
# - package:stats
# - package:graphics
# - package:grDevices
# - package:utils
# - package:datasets
# - package:methods
# 
# - **Autoloads** - An internal environment for objects that R can load on demand (rarely something you interact with directly)
# 
# - **tools:rstudio** - This is specific to RStudio and loads automatically if you’re using that IDE. It’s not part of a plain R session (e.g., if you ran R from the command line)
# 
# - **package:ggplot2** The ggplot2 package we manually loaded with library(ggplot2) in this session
# 
# You will only see standard packages once you start a session. Packages have to be loaded or save/load from workspace via .RData

help(search)


##########################
# 4. Creacion de Objetos #
##########################
# alt + - the da el asignador <- 

ejemplo <- c('este es un test')



#-----------
# Matrices
#-----------

help(rnorm)
help(matrix)
mt1 <- matrix(rnorm(25), nrow = 5, ncol = 5)

set.seed(25478)
mt2 <- matrix(rnorm(25), nrow = 5, ncol = 5)

#-------
# Factor
#-------
help(factor)

pobreza <- c("Pobre Extremo", "Pobre No Extremo", "No Pobre")
pobreza2 <- sample(pobreza, 100, replace = TRUE)

# pobreza2
# [1] "Pobre No Extremo" "Pobre No Extremo" "No Pobre"        
# [4] "Pobre Extremo"    "No Pobre"         "Pobre Extremo"   
# [7] "No Pobre"         "Pobre Extremo"    "Pobre Extremo"   
# [10] "Pobre Extremo"    "Pobre No Extremo" "Pobre Extremo"   
# [13] "Pobre Extremo"    "No Pobre"         "Pobre Extremo"   
# [16] "Pobre Extremo"    "No Pobre"         "No Pobre"        
# [19] "No Pobre"         "Pobre No Extremo" "No Pobre"        
# [22] "No Pobre"         "Pobre Extremo"    "No Pobre"        
# [25] "Pobre No Extremo" "No Pobre"         "No Pobre"        
# [28] "Pobre No Extremo" "Pobre No Extremo" "Pobre Extremo"   
# [31] "Pobre Extremo"    "Pobre Extremo"    "Pobre No Extremo"
# [34] "Pobre No Extremo" "No Pobre"         "Pobre Extremo" 
# ...


class(pobreza2)
# lo siguiente da error:
plot(pobreza2)

# hay que usar type cohersion para cambiar de tipo
fpobreza2 <- as.factor(pobreza2)
class(fpobreza2)

fpobreza2
# fpobreza2
# [1] Pobre No Extremo Pobre No Extremo No Pobre        
# [4] Pobre Extremo    No Pobre         Pobre Extremo   
# [7] No Pobre         Pobre Extremo    Pobre Extremo   
# [10] Pobre Extremo    Pobre No Extremo Pobre Extremo   
# [13] Pobre Extremo    No Pobre         Pobre Extremo   
# [16] Pobre Extremo    No Pobre         No Pobre        
# [19] No Pobre         Pobre No Extremo No Pobre        
# [22] No Pobre         Pobre Extremo    No Pobre 
# ...

# esto ya genera un grafico
plot(fpobreza2)


