
# Install function for packages (automatic)
packages <- function(x){
  x <- as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}
packages(plyr)
if (! ("Rtools" %in% rownames(installed.packages()))) { install.packages("Rtools") }
if (! ("devtools" %in% rownames(installed.packages()))) { install.packages("devtools") }
if (! ("rCharts" %in% rownames(installed.packages()))) { install_github('ramnathv/rCharts') }
library(rCharts)



hist.df2<-modelerData
hist.df2$%%longitudeField%%<-as.numeric(hist.df2$%%longitudeField%%)
hist.df2$%%latitudeField%%<-as.numeric(hist.df2$%%latitudeField%%)
hist.df2$%%longitudeField%% <- round(hist.df2$%%longitudeField%%, 4) #optional
hist.df2$%%latitudeField%% <- round(hist.df2$%%latitudeField%%, 4)
hist.df2$id <- paste0(hist.df2$%%longitudeField%%,"-", hist.df2$%%latitudeField%%) #create identifier for each point
#randomize rows (optional) so that the actual sequence of co-ordinates is not revealed
hist.df2 <- hist.df2[sample(1:nrow(hist.df2), nrow(hist.df2)),]
hist.json <- ddply(hist.df2, .(%%latitudeField%%, %%longitudeField%%), summarise, count=length(id))
#draw leaflet map
leaf <- Leaflet$new()
leaf$setView(c(%%LatitudeCenter%%, %%CenterLongitue%%), %%ZoomCenter%%) #center map at Adelaide, South Australia

hist.json <- toJSONArray2(hist.json, json=F, names=F)
#Using leaflet-heat plugin by Vladimir Agafonkin https://github.com/mourner
leaf$addAssets(jshead = c("http://leaflet.github.io/Leaflet.heat/dist/leaflet-heat.js"
))
leaf$setTemplate(afterScript = sprintf("
                                       <script>
                                       var locationPoints = %s
                                       var heat = L.heatLayer(locationPoints,  {
                                       minOpacity: %%minOpacity%%,
                                       maxZoom: %%maxZoom%%,
                                       radius : %%maxZoom%%,
                                       blur : %%blur%%,
                                       gradient:%%gradient%%
                                       }).addTo(map)           
                                       </script>
                                       ", rjson::toJSON(hist.json)
))
#ADD SOMEHOW THIS CODE
#<link rel="stylesheet" type="text/css" href="test.css" media="screen" />

leaf$set(width = 1600, height = 800)
Basemap=%%CheckPreMap%%
  Mapbox=%%CheckBoxMapBox%%
  Ownmap=%%CheckOwnMap%%
  ESRI1=FALSE
ESRI=substring("%%SelectBaseMap%%", 1, 4)
if(ESRI=="http"){
  ESRI1=TRUE
}
if(Basemap==TRUE & ESRI1==FALSE){
  leaf$tileLayer(provider = "%%SelectBaseMap%%")
}
if(Mapbox==TRUE){
  leaf$tileLayer(  url="http://api.tiles.mapbox.com/v4/%%MapboxID%%/{z}/{x}/{y}.png?access_token=%%MapboxToken%%")
}
if(Ownmap==TRUE){
  leaf$tileLayer(  url="%%tileURL%%")
}
if(ESRI1==TRUE){
  leaf$tileLayer(  url="%%SelectBaseMap%%")
}
leaf$params$layerOpts$attribution='<a href="http://www.esri.com" target="_blank"> <img  src="http://js.arcgis.com/3.11/esri/images/map/logo-med.png"  width="65" ></a>'
#viewing
leaf
#saving
leaf$save("%%saveMap%%.html", cdn=%%CDN%%)
#voila :)


