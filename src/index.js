require('./main.scss');
var $ = jQuery = require('../node_modules/jquery/dist/jquery.js');           // <--- remove if Bootstrap's JS not needed
require('../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js');   // <--- remove if Bootstrap's JS not needed
require('../node_modules/font-awesome/css/font-awesome.css');

// inject bundled Elm app into div#main
var Elm = require('./Main');
var app = Elm.Main.embed(document.getElementById('main'));

// Elm ports to call `window.confirm()` & return the result.
var confirmPorts = {
  'confirmingCancelTest': 'confirmedCancelTest'
}
for (var subName in confirmPorts){
  var sendName = confirmPorts[subName];
  app.ports[subName].subscribe(function(data) {
    console.log(data);
    var notifyMessage = data;
    var wasConfirmed = window.confirm(notifyMessage);
    if (wasConfirmed) {
      app.ports[sendName].send(wasConfirmed);
    }
  });
}