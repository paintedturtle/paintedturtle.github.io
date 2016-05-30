// Generated by CoffeeScript 1.10.0
(function() {
  var resizeLinkedWindow, resizeRemoteWindow;

  document.on("DOMContentLoaded", window.onresize = function(event) {
    document.query("#remotes a.window").forEach(resizeRemoteWindow);
    document.query("#information a.window").forEach(resizeLinkedWindow);
    return document.query("#comparison a.window").forEach(resizeLinkedWindow);
  });

  resizeLinkedWindow = function(aWindow) {
    var widthInPixels;
    console.info({
      linked: aWindow
    });
    aWindow.style.width = "25%";
    widthInPixels = Number((getComputedStyle(aWindow).width).replace("px", ""));
    return aWindow.style.height = Math.max(window.innerHeight / window.innerWidth, 0.66) * widthInPixels + "px";
  };

  resizeRemoteWindow = function(aWindow) {
    var widthInPixels;
    aWindow.style.width = "100%";
    widthInPixels = Number((getComputedStyle(aWindow).width).replace("px", ""));
    return aWindow.style.height = Math.max(window.innerHeight / window.innerWidth, 0.66) * widthInPixels + "px";
  };

}).call(this);
