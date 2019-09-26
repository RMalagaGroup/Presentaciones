##%######################################################%##
#                                                          #
####     Script para análisis de datos de Star Wars     ####
#                                                          #
##%######################################################%##


# Cargamos los datos

library(dplyr)

data(starwars)

# Queremos saber el número de individuos, la altura media y el peso medio, para cada grupo de especies, planetas y género.
# Excluimos aquellos individuos que no tienen todos los datos necesarios y no tengan una nave espacial asignada.
 
starwars %>%
  group_by(species, homeworld, gender) %>%
  filter(!is.na(species),
         !is.na(homeworld),
         !is.na(gender),
         !is.na(height),
         !is.na(mass),
         !is.na(starships)) %>% 
  summarise(count = n(),
            av_height = mean(height),
            av_weight = mean(mass))

# Las autoridades de Naboo están buscando a un lord del Sith oculto que ha saboteado el ponche en la última reunión jedi del planeta. Interrogando a varios asistentes han coincidido en las descripción de un sujeto que habría que encontrar en la base de datos. Estas características son: tez oscura, cabello oscuro, ojos marrones, más de 180 cm de altura y más de 70 kg de peso. ¿Quién es el principal sospechoso?
  
starwars %>%
  filter(skin_color == "dark",
         hair_color == "black",
         eye_color == "brown",
         height > 180, 
         mass > 70) %>%
  select(name, height) %>%
  arrange(desc(height))

# La Princesa Leia Organa de Alderaan va a organizar su guardia de seguridad. Para ello, va a necesitar un grupo de humanos que midan más de 165 cm y además, que sean rubios.
# Para una posterior selección, estos humanos deben agruparse en primer lugar de acuerdo a su planeta de origen y en segundo lugar, por su altura y peso.
# Serán elegidos los tres más altos y más pesados.
# Estas características se deben a que estarán destinados en un planeta con una intensidad de luz y gravedad muy bajas.


starwars %>%
  filter(species == "Human",
         height > 165,
         hair_color %in% c("blond", "blonde")) %>%
  group_by(homeworld, 
           height,
           mass) %>%
  select(name, 
         height,
         mass,
         homeworld,
         gender) %>%
  arrange(desc(height), 
          desc(mass)) %>% 
  top_n(n = 5, height)



# Existe alguna relación entre la estatura y el peso de los personajes?
ggplot(data = starwars, aes(x = height, y = mass)) + 
  geom_point() + 
  geom_smooth()
