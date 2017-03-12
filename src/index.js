'use strict';

require('./index.html'); // copy index into dist
require('normalize.css/normalize.css');
require('./style.scss'); 
require('font-awesome/css/font-awesome.css');


var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');
var app = Elm.Main.embed(mountNode);