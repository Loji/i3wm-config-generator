'use strict';

require('./index.html'); // copy index into dist

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');
var app = Elm.Main.embed(mountNode);