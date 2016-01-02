// TODO: More from
// * https://github.com/jigish/dotfiles/blob/master/slate.js
// * https://github.com/jigish/slate/wiki/Operations
// TODO: -> dotfiles

slate.configAll({
  "windowHintsIgnoreHiddenWindows": false,
  "windowHintsShowIcons": true,
  "windowHintsFontSize": 60,
  "windowHintsFontColor": [0, 0, 150, 0.7]
});

var grid = slate.operation("grid", {
  "grids": {
    "1920x1200": {
      "width": 8,
      "height": 4
    }
  }
});
var hint = slate.operation("hint", {
  "characters": "jklhuionm"
});


// "screenOriginX and screenOriginY are wrong with hidden Dock"
// https://github.com/jigish/slate/issues/272
var moveFull = S.op("move", {
  "x" : 0,
  "y" : "screenOriginY",
  "width" : 1920,
  "height" : "screenSizeY"
});

var moveLeft = moveFull.dup({"width": 960});
var moveRight = moveLeft.dup({"x": 961});
var moveChain = slate.operation("chain", {
  "operations": [moveLeft, moveRight, moveFull]
});

/*
var move1 = moveFull.dup({"width": "screenSizeX/3"});
var move2 = moveFull.dup({"width": "screenSizeX/2"});
var move3 = move1.dup({"x": "screenSizeX/3"});
var move4 = move2.dup({"x": "screenSizeX/3"});
var move5 = move1.dup({"x": "screenSizeX*2/3"});
var move6 = move2.dup({"x": "screenSizeX/2"});
var moveChain = slate.operation("chain", {
  "operations": [move1, move2, move3, move4, move5, move6, moveFull]
});
*/

slate.bindAll({
  "j:ctrl,alt,cmd": hint,
  "k:ctrl,alt,cmd": moveChain,
  "l:ctrl,alt,cmd": grid,
  "u:ctrl,alt,cmd": slate.operation("undo"),
  "r:ctrl,alt,cmd": slate.operation("relaunch")
});
