#install.packages("leaflet")

library("leaflet")

m<-leaflet()

m <- addTiles(m)

## hmm - VB! 
m <- addCircleMarkers(m, lng=-118.2905453, lat=34.0277388,label="City Park Apartment", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28628405273656, lat=34.02365800354032,label="Douglas Fairbanks",     radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28385190117945, lat=34.02255313008476,label="USC entrance",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28323520282908, lat=34.0222295817613,label="Generations Fountain",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28329374460392, lat=34.02059768311025,label="Carolyn Craig",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28904616657485, lat=34.02052118911782,label="Viterbi School of Engineering",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28525397358085, lat=34.0203869706374,label="Forrest Shumway",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28301326957465, lat=34.02151488595282,label="Leavey Library",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.2845534301335, lat=34.02048542474904,label="Edward L. Downey Jr",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28245693646646, lat=34.01883540958542,label="Gaughan and Tiberti",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28486459234612, lat=34.01887890243519,label="Barnett Law Library",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28683887619367, lat=34.018925400482594,label="Hoose Library",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.28774982143034, lat=34.019420309955365,label="Helen Topping",      radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m

