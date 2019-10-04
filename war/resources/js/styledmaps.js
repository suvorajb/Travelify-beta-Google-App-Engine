/**
 * styled maps: various styles are defined here
 */
var styles_mc_dark 		= [{"featureType":"water","stylers":[{"color":"#021019"}]},{"featureType":"landscape","stylers":[{"color":"#08304b"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#0c4152"},{"lightness":5}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#0b434f"},{"lightness":25}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},{"featureType":"road.arterial","elementType":"geometry.stroke","stylers":[{"color":"#0b3d51"},{"lightness":16}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#000000"},{"lightness":13}]},{"featureType":"transit","stylers":[{"color":"#146474"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#144b53"},{"lightness":14},{"weight":1.4}]}];

var styles_retro 		= [{"featureType":"administrative","stylers":[{"visibility":"off"}]},{"featureType":"poi","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"water","stylers":[{"visibility":"simplified"}]},{"featureType":"transit","stylers":[{"visibility":"simplified"}]},{"featureType":"landscape","stylers":[{"visibility":"simplified"}]},{"featureType":"road.highway","stylers":[{"visibility":"off"}]},{"featureType":"road.local","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"visibility":"on"}]},{"featureType":"water","stylers":[{"color":"#84afa3"},{"lightness":52}]},{"stylers":[{"saturation":-17},{"gamma":0.36}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#3f518c"}]}];

var styles_nb 			= [{"featureType":"water","elementType":"geometry","stylers":[{"color":"#193341"}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#2c5a71"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#29768a"},{"lightness":-37}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#406d80"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#406d80"}]},{"elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#3e606f"},{"weight":2},{"gamma":0.84}]},{"elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"administrative","elementType":"geometry","stylers":[{"weight":0.6},{"color":"#1a3541"}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#2c5a71"}]}];

var styles_cobalt_dark 	= [{"featureType":"all","elementType":"all","stylers":[{"invert_lightness":true},{"saturation":10},{"lightness":30},{"gamma":0.5},{"hue":"#435158"}]}];

var styles_blue_dark 	= [{"featureType":"all","stylers":[{"hue":"#0000b0"},{"invert_lightness":"true"},{"saturation":-30}]}];

var styles_bluish 		= [{"stylers":[{"hue":"#007fff"},{"saturation":89}]},{"featureType":"water","stylers":[{"color":"#ffffff"}]},{"featureType":"administrative.country","elementType":"labels","stylers":[{"visibility":"off"}]}];

var styles_grey 		= [{"featureType":"all","stylers":[{"saturation":-100},{"gamma":0.5}]}];

var styles_icy_blue 	= [{"stylers":[{"hue":"#2c3e50"},{"saturation":250}]},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":50},{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]}];

var styles_red_hues 	= [{"stylers":[{"hue":"#dd0d0d"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":100},{"visibility":"simplified"}]}];

var styles_green 		= [{"stylers":[{"hue":"#bbff00"},{"weight":0.5},{"gamma":0.5}]},{"elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"landscape.natural","stylers":[{"color":"#a4cc48"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#ffffff"},{"visibility":"on"},{"weight":1}]},{"featureType":"administrative","elementType":"labels","stylers":[{"visibility":"on"}]},{"featureType":"road.highway","elementType":"labels","stylers":[{"visibility":"simplified"},{"gamma":1.14},{"saturation":-18}]},{"featureType":"road.highway.controlled_access","elementType":"labels","stylers":[{"saturation":30},{"gamma":0.76}]},{"featureType":"road.local","stylers":[{"visibility":"simplified"},{"weight":0.4},{"lightness":-8}]},{"featureType":"water","stylers":[{"color":"#4aaecc"}]},{"featureType":"landscape.man_made","stylers":[{"color":"#718e32"}]},{"featureType":"poi.business","stylers":[{"saturation":68},{"lightness":-61}]},{"featureType":"administrative.locality","elementType":"labels.text.stroke","stylers":[{"weight":2.7},{"color":"#f4f9e8"}]},{"featureType":"road.highway.controlled_access","elementType":"geometry.stroke","stylers":[{"weight":1.5},{"color":"#e53013"},{"saturation":-42},{"lightness":28}]}];

var styles_neon 		= [{"stylers":[{"saturation":100},{"gamma":0.6}]}];

var styles_candy 		= [{"featureType":"landscape","stylers":[{"hue":"#FFE100"},{"saturation":34.48275862068968},{"lightness":-1.490196078431353},{"gamma":1}]},{"featureType":"road.highway","stylers":[{"hue":"#FF009A"},{"saturation":-2.970297029703005},{"lightness":-17.815686274509815},{"gamma":1}]},{"featureType":"road.arterial","stylers":[{"hue":"#FFE100"},{"saturation":8.600000000000009},{"lightness":-4.400000000000006},{"gamma":1}]},{"featureType":"road.local","stylers":[{"hue":"#00C3FF"},{"saturation":29.31034482758622},{"lightness":-38.980392156862735},{"gamma":1}]},{"featureType":"water","stylers":[{"hue":"#0078FF"},{"saturation":0},{"lightness":0},{"gamma":1}]},{"featureType":"poi","stylers":[{"hue":"#00FF19"},{"saturation":-30.526315789473685},{"lightness":-22.509803921568633},{"gamma":1}]}];

var styles_orange 		= [
                  		          	{
                  		      		"featureType": "landscape",
                  		      		"stylers": [
                  		      			{
                  		      				"hue": "#FFCC00"
                  		      			},
                  		      			{
                  		      				"saturation": 58.20000000000002
                  		      			},
                  		      			{
                  		      				"lightness": -14.600000000000009
                  		      			},
                  		      			{
                  		      				"gamma": 1
                  		      			}
                  		      		]
                  		      	},
                  		      	{
                  		      		"featureType": "road.highway",
                  		      		"stylers": [
                  		      			{
                  		      				"hue": "#FF5800"
                  		      			},
                  		      			{
                  		      				"saturation": 12.200000000000017
                  		      			},
                  		      			{
                  		      				"lightness": -20.200000000000003
                  		      			},
                  		      			{
                  		      				"gamma": 1
                  		      			}
                  		      		]
                  		      	},
                  		      	{
                  		      		"featureType": "road.arterial",
                  		      		"stylers": [
                  		      			{
                  		      				"hue": "#FF6F00"
                  		      			},
                  		      			{
                  		      				"saturation": 0
                  		      			},
                  		      			{
                  		      				"lightness": -34.400000000000006
                  		      			},
                  		      			{
                  		      				"gamma": 1
                  		      			}
                  		      		]
                  		      	},
                  		      	{
                  		      		"featureType": "road.local",
                  		      		"stylers": [
                  		      			{
                  		      				"hue": "#FF7D00"
                  		      			},
                  		      			{
                  		      				"saturation": 0
                  		      			},
                  		      			{
                  		      				"lightness": 0
                  		      			},
                  		      			{
                  		      				"gamma": 1
                  		      			}
                  		      		]
                  		      	},
                  		      	{
                  		      		"featureType": "water",
                  		      		"stylers": [
                  		      			{
                  		      				"hue": "#00A4FF"
                  		      			},
                  		      			{
                  		      				"saturation": 0
                  		      			},
                  		      			{
                  		      				"lightness": 0
                  		      			},
                  		      			{
                  		      				"gamma": 1
                  		      			}
                  		      		]
                  		      	},
                  		      	{
                  		      		"featureType": "poi",
                  		      		"stylers": [
                  		      			{
                  		      				"hue": "#FFF600"
                  		      			},
                  		      			{
                  		      				"saturation": 0
                  		      			},
                  		      			{
                  		      				"lightness": 0
                  		      			},
                  		      			{
                  		      				"gamma": 1
                  		      			}
                  		      		]
                  		      	}
                  		      ];

var styles_purple			=	[
                 		 	        	{
                 		 	      		"featureType": "landscape",
                 		 	      		"stylers": [
                 		 	      			{
                 		 	      				"hue": "#CC00FF"
                 		 	      			},
                 		 	      			{
                 		 	      				"saturation": 63.19999999999999
                 		 	      			},
                 		 	      			{
                 		 	      				"lightness": -7.800000000000011
                 		 	      			},
                 		 	      			{
                 		 	      				"gamma": 1
                 		 	      			}
                 		 	      		]
                 		 	      	},
                 		 	      	{
                 		 	      		"featureType": "road.highway",
                 		 	      		"stylers": [
                 		 	      			{
                 		 	      				"hue": "#A100FF"
                 		 	      			},
                 		 	      			{
                 		 	      				"saturation": 12.200000000000017
                 		 	      			},
                 		 	      			{
                 		 	      				"lightness": -20.200000000000003
                 		 	      			},
                 		 	      			{
                 		 	      				"gamma": 1
                 		 	      			}
                 		 	      		]
                 		 	      	},
                 		 	      	{
                 		 	      		"featureType": "road.arterial",
                 		 	      		"stylers": [
                 		 	      			{
                 		 	      				"hue": "#6400FF"
                 		 	      			},
                 		 	      			{
                 		 	      				"saturation": 0
                 		 	      			},
                 		 	      			{
                 		 	      				"lightness": -34.400000000000006
                 		 	      			},
                 		 	      			{
                 		 	      				"gamma": 1
                 		 	      			}
                 		 	      		]
                 		 	      	},
                 		 	      	{
                 		 	      		"featureType": "road.local",
                 		 	      		"stylers": [
                 		 	      			{
                 		 	      				"hue": "#7F00FF"
                 		 	      			},
                 		 	      			{
                 		 	      				"saturation": 0
                 		 	      			},
                 		 	      			{
                 		 	      				"lightness": 0
                 		 	      			},
                 		 	      			{
                 		 	      				"gamma": 1
                 		 	      			}
                 		 	      		]
                 		 	      	},
                 		 	      	{
                 		 	      		"featureType": "water",
                 		 	      		"stylers": [
                 		 	      			{
                 		 	      				"hue": "#00EAFF"
                 		 	      			},
                 		 	      			{
                 		 	      				"saturation": 0
                 		 	      			},
                 		 	      			{
                 		 	      				"lightness": 0
                 		 	      			},
                 		 	      			{
                 		 	      				"gamma": 1
                 		 	      			}
                 		 	      		]
                 		 	      	},
                 		 	      	{
                 		 	      		"featureType": "poi",
                 		 	      		"stylers": [
                 		 	      			{
                 		 	      				"hue": "#E700FF"
                 		 	      			},
                 		 	      			{
                 		 	      				"saturation": 0
                 		 	      			},
                 		 	      			{
                 		 	      				"lightness": 0
                 		 	      			},
                 		 	      			{
                 		 	      				"gamma": 1
                 		 	      			}
                 		 	      		]
                 		 	      	}
                 		 	      ];

var styles_pink 			= 	[
                			  	        	{
                			  	      		"featureType": "landscape",
                			  	      		"stylers": [
                			  	      			{
                			  	      				"hue": "#FF00C6"
                			  	      			},
                			  	      			{
                			  	      				"saturation": 75.4
                			  	      			},
                			  	      			{
                			  	      				"lightness": 7.399999999999977
                			  	      			},
                			  	      			{
                			  	      				"gamma": 1
                			  	      			}
                			  	      		]
                			  	      	},
                			  	      	{
                			  	      		"featureType": "road.highway",
                			  	      		"stylers": [
                			  	      			{
                			  	      				"hue": "#FF0078"
                			  	      			},
                			  	      			{
                			  	      				"saturation": 21.39999999999999
                			  	      			},
                			  	      			{
                			  	      				"lightness": -14.400000000000006
                			  	      			},
                			  	      			{
                			  	      				"gamma": 1
                			  	      			}
                			  	      		]
                			  	      	},
                			  	      	{
                			  	      		"featureType": "road.arterial",
                			  	      		"stylers": [
                			  	      			{
                			  	      				"hue": "#FBFF00"
                			  	      			},
                			  	      			{
                			  	      				"saturation": 0
                			  	      			},
                			  	      			{
                			  	      				"lightness": 0
                			  	      			},
                			  	      			{
                			  	      				"gamma": 1
                			  	      			}
                			  	      		]
                			  	      	},
                			  	      	{
                			  	      		"featureType": "road.local",
                			  	      		"stylers": [
                			  	      			{
                			  	      				"hue": "#00FFFD"
                			  	      			},
                			  	      			{
                			  	      				"saturation": 0
                			  	      			},
                			  	      			{
                			  	      				"lightness": 0
                			  	      			},
                			  	      			{
                			  	      				"gamma": 1
                			  	      			}
                			  	      		]
                			  	      	},
                			  	      	{
                			  	      		"featureType": "water",
                			  	      		"stylers": [
                			  	      			{
                			  	      				"hue": "#0078FF"
                			  	      			},
                			  	      			{
                			  	      				"saturation": 0
                			  	      			},
                			  	      			{
                			  	      				"lightness": 0
                			  	      			},
                			  	      			{
                			  	      				"gamma": 1
                			  	      			}
                			  	      		]
                			  	      	},
                			  	      	{
                			  	      		"featureType": "poi",
                			  	      		"stylers": [
                			  	      			{
                			  	      				"hue": "#9FFF00"
                			  	      			},
                			  	      			{
                			  	      				"saturation": 0
                			  	      			},
                			  	      			{
                			  	      				"lightness": 0
                			  	      			},
                			  	      			{
                			  	      				"gamma": 1
                			  	      			}
                			  	      		]
                			  	      	}
                			  	      ];
