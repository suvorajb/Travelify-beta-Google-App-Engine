		function recommendHotels() {
			var tripdestn = $("#tripplace").val();
			
			if($.trim(tripdestn)=="") {
				alert('You forgot to let us know where are you going...');
				return false;
			}
			
			$('#loading').show();
			
			var hotel_query_url = "/placequery/" + "?query=popular+hotels+in+" + tripdestn + "&type=lodging&resultcnt=0";

			$.getJSON(hotel_query_url, function(data) {
				var txtappnd = "";
				var i=1;
				var j=1;
				
				var img_src = "";

				$('#suggestHotel').append(txtappnd);
				
				$.each( data.places, function( key, place ) {
					img_src = 'http://maps.googleapis.com/maps/api/streetview?size=225x200&sensor=false&location=' + place.geometry.location.lat 
							  + ',' + place.geometry.location.lng + '&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U';

					  $('#hotelimg'+i).attr({ src: img_src,  title: place.name,  alt: place.name  });
					  $('#hdtls'+i).html('<p><address><strong>' + place.name + '</strong> <br/>' + place.formattedAddress + '</address> </p>'); 
					  $('#hotelrdo'+i).val(place.geometry.location.lat + ';' + place.geometry.location.lng + ';' + place.name + ';' + place.formattedAddress + ';');
					  $('#hotelcell'+i).show();
					  
					  i++;
				});

				$('#loading').hide();			
				
			});
			
			return false;
		}