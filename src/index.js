require( './main.scss' );
var $ = jQuery = require('../node_modules/jquery/dist/jquery.js');           // <--- remove if Bootstrap's JS not needed
require('../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js');   // <--- remove if Bootstrap's JS not needed 

// inject bundled Elm app into div#main
var Elm = require('./Main');
Elm.Main.embed(document.getElementById('main')); 