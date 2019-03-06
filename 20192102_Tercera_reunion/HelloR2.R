# COMANDOS RESUELTOS DE HelloR2.PDF

#Importar el dataset HairEyeColor
library(datasets)
data("HairEyeColor")

# Si el dataset importado no es un dataframe convertirlo a dataframe.
class(HairEyeColor)
View(HairEyeColor)
str(HairEyeColor)
HairEyeColor$Hair


# lo importo ahora en una variable que llamaré my.data

my.data <- as.data.frame(HairEyeColor)
View(my.data)
my.data$Hair

#resumen de los datos
summary(my.data)
str(my.data)

# Para coger columnas usando el operador $
my.eye <- my.data$Eye
my.eye
class(my.eye)


# Tabla de contingencia
table(my.eye)
mi.tabla <- table(my.eye)
mi.tabla
mi.tabla["Brown"]
mi.tabla[1]

 
# coger columnas por número de columna  

my.freq <- my.data$Freq
class(my.freq)
my.freq[1:4]
mean(my.freq)

# * Obtener número de columnas, número de filas.

dim(my.data)

filas <- dim(my.data)[1]
columnas <- dim(my.data)[2]

length(my.data)#columnas

length((my.data$Hair))#filas


# * Guardar en un vector el nombre de las columnas. 

(nombres <- colnames(my.data))

# * Cambiar el nombre de la primera columna.
colnames(my.data)[1] <- "Pelo"

# * Averiguar el tipo de datos de la primera columna.

str(my.data$Pelo)
class(my.data$Pelo)


## Manipular Datasets - Data Frames
 

#Forma 1




# ## Manipular Datasets - Data Frames  
# * Comando para averiguar si hay valores NA en todo el dataframe,
# y lo mismo en la columna 1.

#metemos algún NA

my.data$Freq[4] <- NA

my.data$Freq[14] <- NA

# Defino una función para averiguar si hay valores NA 
#en todo el dataframe, y lo mismo en una columna  

hay.Na.en.columna <-function(columna){
  nas.colum <- is.na(my.data$Freq)
  resul <- as.logical(sum(is.na(my.data$Freq)))
  return(resul)
}#end function
  
hay.Na.en.columna(my.data$Freq)

anyNA(my.data)

which(is.na(my.data))

# * Practicar con el dataset para extraer un conjunto de filas y/o columnas.

my.data[1:5,]
my.data[filas-5:filas,]
my.data[(filas-5):filas,]

my.data[,"Pelo"]
my.data[,1]

head(my.data[,c(2,4)])

# con el - delante no selecciono esas columnas
head(my.data[,-c(2,4)])



# * Guardar cinco primeras filas en una variable *d1* y 
# las cinco últimas en una variable *d2* y 
# combinarlas en un nuevo dataframe llamado *d12*. 

d1 <- my.data[1:5,]
d2 <- my.data[(filas-5):filas,]
d12 <- rbind(d1,d2)
d12

# * Utilizar el comando **subset** para extraer, 
# eliminar, etc. un conjunto de columnas de un data set.


which(my.data$Hair == "Red" & my.data$Eye == "Blue")

datos1 <- my.data[which(my.data$Hair == "Red" & my.data$Eye == "Blue"),  ]
datos1

# con subset
datos1 <- subset(my.data, Hair == "Red" & Eye == "Blue" ,select=c(colnames(my.data)))
datos1

datos1 <- subset(my.data, Hair == "Red" & Eye == "Blue" ,select=c(1,3))

datos1

# * Usar **subset** para guardar en una variable 
# las filas de dataset con valor para *eye* de *Blue*.

## Manipular Datasets - Data Frames

# * Guardar la primera columna en variable *d* y utilizar los comandos **unique**, **table**. ¿Pa
# Para qué sirven estos comandos?.

d <- unique(my.data$Hair)

d <- levels(my.data$Hair)
d



# * Con la variable *d* usar **colSums**, **colMeans**. Explicar con ejemplos para qué sirven estos comandos.

 m <- data.frame(0:10,20:30,30:40)
m

colSums(m[1:2])


 
