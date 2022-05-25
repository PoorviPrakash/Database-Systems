var myPoints=[]
var center = {latitude:34.02131506244371,longitude: -118.28924242270375}
var R=8, r=1, a=4;
var scale=0.001
var cos=Math.cos, sin=Math.sin, pi = Math.PI;
function GetCoordinates(t){
	return [
	 center.longitude+scale*((R+r)*sin((r/R)*t) - a*sin((1+r/R)*t)),center.latitude+scale*((R+r)*cos((r/R)*t) - a*cos((1+r/R)*t)),50
	]
}
var temp;
for(var t=0.00;t<(pi*16);t+=0.1){
	temp = GetCoordinates(t)
	console.log(temp[0]+","+temp[1]+","+temp[2])
	myPoints.push(temp)
}