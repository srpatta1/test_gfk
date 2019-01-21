({
   jsLoaded: function(component, event, helper) {
      var lang;var lat;
      var latlang = event.getParam("latlang");
      
      for (var i=0; i<latlang.length; i++) {
            var result = latlang[i].split(",");
             lang =parseFloat(result[0]);
             lat=parseFloat(result[1]);
      }
      var map = L.map('map', {zoomControl: true, tap: false})
                  .setView([lat, lang], 2);
      L.tileLayer(
       'https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}',
       {
              attribution: 'Tiles © Esri'
       }).addTo(map);
        component.set("v.map", map);
        var map = component.get("v.map");
        var aNorth  =   map.getBounds().getNorthEast().lat;
        var aEast   =   map.getBounds().getNorthEast().lng;
        var aSouth  =   map.getBounds().getSouthWest().lat;   
        var aWest   =   map.getBounds().getSouthWest().lng;  
        
        var action = component.get("c.getEarthquakeNamesCor");
        action.setParams({ "north":aNorth,"south" : aSouth,
                           "east"  : aEast,"west" : aWest});
        action.setCallback(this,function(a){
                //get the response state
                var state = a.getState();
              
                //check if result is successfull
                if(state == "SUCCESS"){
                    var result =a.getReturnValue();
                    
                    
                    component.set("v.coordinates",a.getReturnValue());
                    
                     var cor = component.get("v.coordinates");
      
                    for (var i=0; i<cor.length; i++) {
                        
                        var corR= cor[i].split(",");
                        var lang1 =parseFloat(corR[0]);
                        var lat1=parseFloat(corR[1]);
                        var depth = corR[2];
                        var mag = corR[3];
                        L.marker([lat1,lang1]).addTo(map).bindPopup("Depth :" +depth+"<br/>" +"Magnitude :" + mag  );
       
            
        }
                    
                } else if(state == "ERROR"){
                    alert('Error in calling server side action');
                }
            });
            
            //adds the server-side action to the queue        
           $A.enqueueAction(action);
        
	}
})