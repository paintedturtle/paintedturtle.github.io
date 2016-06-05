// Generated by CoffeeScript 1.10.0
(function() {
  var renderInstrumentPage;

  document.on("DOMContentLoaded", function() {
    var identifier;
    if (window.location.pathname.match("/instruments/*")) {
      identifier = window.location.pathname.split("/").pop().replace(".html", "");
      return renderInstrumentPage({
        instrument: window.instruments.find(function(instrument) {
          return instrument.identifier === identifier;
        }),
        title: document.pull("title"),
        body: document.pull("body")
      });
    }
  });

  renderInstrumentPage = function(params) {
    var body, cover, header, instrument, summary, title;
    instrument = params.instrument, title = params.title, body = params.body;
    title.innerText = instrument.make + " " + instrument.model + " " + instrument["function"] + " in Ottawa 🐢";
    header = d3.select("body > article").append("header");
    header.html("<h1>" + instrument.make + " " + instrument.model + " " + instrument["function"] + "</h1>\n<div style=\"opacity:0.5;\">Manufactured in " + instrument["year"] + "</div>\n<div style=\"opacity:0.5;\">Serial #" + instrument["serial number"] + "</div>");
    cover = d3.select("body > article").append("figure").attr({
      id: "cover"
    });
    cover.html("<img src=\"/instruments/" + instrument.identifier + "/cover.jpg\">\n<div class=\"price d2\" style=\"background:hsl(270, 33%, 30%);\"><big><a>$</a><b>" + instrument.price + "</b></big><small><a>.</a><b>00</b></small></div>");
    summary = d3.select("body > article").append("div").attr({
      id: "summary"
    });
    return summary.append("pre").html(instrument.summary);
  };

}).call(this);
