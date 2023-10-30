#------
rm(list = ls())
Dep=""
mapaD='https://github.com/YURFA-Pucp/Tesis_2/raw/main/mapas/MapaDistritos.gpkg'

library(sf)
st_layers(mapaD)

#------

peruDep=sf::st_read(Dep,layer='peru')
peru=sf::st_read(mapaD,layer='peru')

library(ggplot2)
base=peruDep
base1$distrito_propuesto=NULL


distritos <- ggplot() + geom_sf(data = peru, aes(fill = Total_mb5_level), color='#c8c8c8', lwd = 0.001, show.legend = TRUE) +
  scale_fill_manual(values = c("#F9FAFF","#A3A9BB","#606F96", "#0F255E")) +
  labs(fill = "Demanda para la creación de distritos") +  # Etiqueta de la leyenda de colores
  guides(fill = guide_legend(title.position = "top", label.position = "right", title.theme = element_text(size = 11)))+
  theme(legend.position = "bottom") +# Posición de la leyenda
  theme_void() #quita las líneas

choro3 <- distritos + geom_sf(data=base, color="#aaaaaa",fill="transparent",lwd = 0.9)
choro3
