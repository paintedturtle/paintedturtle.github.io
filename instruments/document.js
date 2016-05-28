// Generated by CoffeeScript 1.10.0
(function() {
  document.pull = document.querySelector;

  document.query = function(selector) {
    return Array.from(document.querySelectorAll(selector));
  };

  document.on = function(eventname, selector, procedure) {
    var wrapped;
    if (selector instanceof Function) {
      procedure = selector;
      selector = void 0;
    }
    if (selector) {
      wrapped = function(event) {
        var element;
        if (element = event.target.closest(selector)) {
          return procedure(event, element);
        }
      };
    } else {
      wrapped = procedure;
    }
    return document.addEventListener(eventname, wrapped);
  };

  document.on("DOMContentLoaded", function() {
    return console.info({
      "document object model is ready": performance.now()
    });
  });

  document.on("DOMContentLoaded", function() {
    return document.query("a[href]").forEach(function(hyperlink) {
      if (hyperlink.href.toString().match("http:")) {
        hyperlink.setAttribute("href", hyperlink.href.toString() + ".html");
        return console.info(hyperlink.href);
      }
    });
  });

}).call(this);
