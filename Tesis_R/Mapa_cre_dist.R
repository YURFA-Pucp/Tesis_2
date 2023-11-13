#------
rm(list = ls())
Dep="https://github.com/Proyecto-Magallanes/Dashboard/raw/main/mapas/PeruMapa.gpkg"
mapaD='https://github.com/YURFA-Pucp/Tesis_2/raw/main/mapas/MapaDistritos.gpkg'
mapaMCP='https://github.com/YURFA-Pucp/Tesis_2/raw/main/mapas/MapaMCP.gpkg'
mapaMCP_dep='https://github.com/YURFA-Pucp/Tesis_2/raw/main/mapas/MapaMCP_dep.gpkg'

library(sf)
st_layers(mapaD)

#------

library(dplyr)

peruDep=sf::st_read(Dep,layer='peru')
peru=sf::st_read(mapaD,layer='peru')
peruMCP=sf::st_read(mapaMCP,layer='peru')
peruMCP_dep=sf::st_read(mapaMCP_dep,layer='peru')

departamentos_interes <- c("APURIMAC", "AYACUCHO", "HUANCAVELICA", "CUSCO", "HUANUCO")
subset_dep <- peruDep %>% filter(DEPARTAMEN %in% departamentos_interes)


library(ggplot2)
base=peruDep
base1=peru
#-------
distritos <- ggplot() + geom_sf(data = peru, aes(fill = Total_mb5_level), color='#bdbdbd', lwd = 0.01, show.legend = TRUE) +
  #scale_fill_manual(values = c("#F9FAFF","#A3A9BB","#606F96", "#0F255E")) +
  scale_fill_brewer(palette = "BuPu")+
  labs(fill = "Demanda para la creación de distritos") +  # Etiqueta de la leyenda de colores
  guides(fill = guide_legend(title.position = "top", label.position = "right", title.theme = element_text(size = 10)))+
  theme(legend.position = "bottom") +# Posición de la leyenda
  theme_void() #quita las líneas

Mapa1 <- distritos + geom_sf(data=subset_dep, color="#636363",fill="transparent",lwd = 0.05)
Mapa1
#-----

baseMap=ggplot() + geom_sf(data=base, color='#636363',fill='white',lwd = 0.5) + theme_void()

mcp <- baseMap + geom_sf(data = peruMCP_dep, aes(fill = DesCenPob), color='#252525', lwd = 0.65, show.legend = TRUE) +
    scale_fill_gradient(low ="#bfd3e6",high = "#6e016b", name="Cantidad de MCP")+
    guides(fill = guide_colorbar(
          title.position = "top",
          label.position = "right",
          title.theme = element_text(size = 10),
          label.theme = element_text(size = 8))) +
    theme(legend.position = "right") # Posición de la leyenda
  
mcp


