
$('button#get_incidents').on('click',function(){
 
 var baseUrl = 'https://data.cityofnewyork.us/resource/a6b3-u8ax.json';
 var borough = $('input#incidents_input').val();

 $.ajax({
    url: baseUrl,
    method: 'GET',
    success: function(response, status){
    var output;
    var resultsArray = [];
      for (var i=0; i<response.length-1; i++){
       if (response[i].borough === borough){
        output = response[i].incident_type;
        resultsArray.push(output)
        };
      };  
      if(resultsArray.length === 0)
        return null;

      var modeMap = {};
      var maxEl = resultsArray[0], maxCount = 1;
      
      for(var i = 0; i < resultsArray.length; i++){ 
        var el = resultsArray[i];
        if(modeMap[el] == null)
          modeMap[el] = 1;
          else
            modeMap[el]++;  
        if(modeMap[el] > maxCount)
        {
        maxEl = el;
        maxCount = modeMap[el];
      }
    } 
   
        console.log(modeMap)


      $('#incidentsResults').text(`The incidents occurring most were of type: ${maxEl}`);
      // $('#incidentsResults').text(resultsArray);
      $('#incidentsCount').text(`The total number of incidents occurred in ${borough}: ${resultsArray.length}`);

    }

  });
});

$('button#help').on('click',function(){
  alert('Type either "Bronx", "Brooklyn", Manhattan", "Queens", or "Staten Island" in the search box.');
})
