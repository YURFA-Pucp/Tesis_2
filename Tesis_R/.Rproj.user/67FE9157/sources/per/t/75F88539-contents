#------
rm(list = ls())
Dep="https://github.com/Proyecto-Magallanes/Dashboard/raw/main/mapas/PeruMapa.gpkg"
mapaD='https://github.com/YURFA-Pucp/Tesis_2/raw/main/mapas/MapaDistritos.gpkg'
mapaMCP='https://github.com/YURFA-Pucp/Tesis_2/raw/main/mapas/MapaMCP.gpkg'
mapaMCP_dep='https://github.com/YURFA-Pucp/Tesis_2/raw/main/mapas/MapaMCP_dep.gpkg'

library(sf)
st_layers(mapaD)

#------

peruDep=sf::st_read(Dep,layer='peru')
peru=sf::st_read(mapaD,layer='peru')
peruMCP=sf::st_read(mapaMCP,layer='peru')
peruMCP_dep=sf::st_read(mapaMCP_dep,layer='peru')

library(ggplot2)
base=peruDep
base1=peru
#-------
distritos <- ggplot() + geom_sf(data = peru, aes(fill = Total_mb5_level), color='#c8c8c8', lwd = 0.001, show.legend = TRUE) +
  scale_fill_manual(values = c("#F9FAFF","#A3A9BB","#606F96", "#0F255E")) +
  labs(fill = "Demanda para la creación de distritos") +  # Etiqueta de la leyenda de colores
  guides(fill = guide_legend(title.position = "top", label.position = "right", title.theme = element_text(size = 11)))+
  theme(legend.position = "bottom") +# Posición de la leyenda
  theme_void() #quita las líneas

Mapa1 <- distritos + geom_sf(data=base, color="#aaaaaa",fill="transparent",lwd = 0.9)
Mapa1
#-----

baseMap=ggplot() + geom_sf(data=base, color='grey60',fill='white',lwd = 1) + theme_void()

mcp <- baseMap + geom_sf(data = peruMCP_dep, aes(fill = DesCenPob), color='grey60', lwd = 1, show.legend = TRUE) +
    scale_fill_gradient(low ="#F9FAFF",high = "#0F255E", name="Cantidad de MCP")+
    guides(fill = guide_colorbar(
          title.position = "top",
          label.position = "right",
          title.theme = element_text(size = 11),
          label.theme = element_text(size = 10))) +
    theme(legend.position = "right") # Posición de la leyenda
  
mcp


