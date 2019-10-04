/**
 * 
 */

        // Your client ID
        var clientId = '58996761750.apps.googleusercontent.com';

        // Your API key
        var apiKey = 'AIzaSyCmUrF7Fhn6l7oEuRI0U9FPOO3rNUsW29M';

        // The authorization scope
        var scopes = 'https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/userinfo.profile';
        
        var token = "";
        
        function disconnectUser() {
			var revokeUrl = 'https://accounts.google.com/o/oauth2/revoke?token=' + token;
			// Perform an asynchronous GET request.
			$.ajax({
			  type: 'GET',
			  url: revokeUrl,
			  async: false,
			  contentType: "application/json",
			  dataType: 'jsonp',
			  success: function(nullResponse) {
				// Do something now that user is disconnected
				// The response is always undefined.
				  $('#mssgmodal').html('<h3>Successfully disconnected from Google+ </h3><button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>');
				  $('#mssgmodal').modal('show');
			  },
			  error: function(e) {
				// Handle the error
				// console.log(e);
				// You could point users to manually disconnect if unsuccessful
				// https://plus.google.com/apps
				  $('#mssgmodal').html('<h3>Error occurred while disconnecting from Google+ pls try again</h3><button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>');
				  $('#mssgmodal').modal('show');
			  }
			});
		}

        // onliad initialization
        function onloadInitialization() {
            // set our own api key
            gapi.client.setApiKey(apiKey);

            // and checkAuth in 1 ms
            window.setTimeout(checkAuth, 1);
        }

        // check authorization
        function checkAuth() {
            gapi.auth.authorize({
                client_id: clientId,
                scope: scopes,
                immediate: true
            }, handleAuthResult);
        }

        // handle authorization result
        function handleAuthResult(authResult) {
            var connectButton = document.getElementById('connectgplus');
            var disconnectButton = document.getElementById('disconnectgplus');
            
            if (authResult && ! authResult.error) {
            	token = authResult.access_token;
            	connectButton.style.visibility = 'hidden';
            	disconnectButton.style.visibility = '';
            	disconnectButton.onclick = disconnectUser;
                makeGoogleApiCalls();
            } else {
            	connectButton.style.visibility = '';
            	disconnectButton.style.visibility = 'hidden';
            	connectButton.onclick = handleAuthClick;
            }
        }

        // handle onclick event of Login button
        function handleAuthClick(event) {
            gapi.auth.authorize({
                client_id: clientId,
                scope: scopes,
                immediate: false
            }, handleAuthResult);

            return false;
        }

        // make Google API calls: obtain logged-in member info and activity of friends
        function makeGoogleApiCalls() {
            gapi.client.load('plus', 'v1', function() {

                // Request1: obtain logged-in member info
                var request = gapi.client.plus.people.get({
                    'userId': 'me'
                });
                
                request.execute(function(aInfo) {
					//got user information and display
                	var myprofilepic = 'https://plus.google.com/s2/photos/profile/'+ aInfo.id;
					var profiledata = aInfo.id + ';' + myprofilepic + ';' + aInfo.url;
					//alert(profiledata);
					//$.post("/saveprofile", {profiledata: profiledata});
                	
					var imgPrfle = $('#usrProfilePic').attr('src');
					
                	if(imgPrfle.length>0) {}
                	else {
                		$('#usrProfilePic').attr('src', myprofilepic);
                	}
					
					$('#usrDisplayName').html('<h2>Welcome ' + aInfo.displayName + '</h2>');
                }); // end of reuest call
                
                
                
	              /*var frndRequest = gapi.client.plus.people.list({
	              	  'userId' : 'me',
	              	  'collection' : 'visible'
	              });                
	              frndRequest.execute(function(activityInfo) {
	                  var actstr = JSON.stringify(activityInfo.items);
					  alert(actstr);
	                  $('#frndList').html(
	                      $('#gplusInviteFriends').render(activityInfo.items)
	                  );
	              });*/
                
            });
        }