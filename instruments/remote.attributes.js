// Generated by CoffeeScript 1.10.0
(function() {
  var Location_Information, Name_And_Address, addLocationInformationTo, addModelAndSerialNumberTo, addNameAndAddressTo, renderDocumentAttributes, renderKijijiAttributes, renderReverbAttributes, renderTextForKijiji, renderTextForReverb, renderTitleForKijiji, renderTitleForReverb;

  if (location.hostname === "paintedturtle.dev") {
    document.on("DOMContentLoaded", function(event) {
      renderDocumentAttributes();
      renderKijijiAttributes();
      return renderReverbAttributes();
    });
  }

  renderDocumentAttributes = function() {
    var element;
    element = document.createElement("div");
    element.id = "document-attributes";
    element.className = "remote attributes";
    element.innerHTML = "<header>Document Attributes</header>\n<pre class=\"title\">" + (document.pull("title").innerText) + "</pre>";
    return document.body.appendChild(element);
  };

  renderKijijiAttributes = function() {
    var element;
    element = document.createElement("div");
    element.id = "kijiji-attributes";
    element.className = "remote attributes";
    element.innerHTML = "<header>Kijiji Attributes</header>\n<pre class=\"title\">" + (renderTitleForKijiji()) + "</pre>\n<pre class=\"description\">" + (renderTextForKijiji()) + "</pre>";
    return document.body.appendChild(element);
  };

  renderTitleForKijiji = function() {
    return document.pull("title").innerText.split("in Ottawa")[0];
  };

  renderTextForKijiji = function() {
    var paragraphs, pre;
    pre = document.pull("article #summary pre");
    paragraphs = pre.innerText.split("\n\n");
    paragraphs = paragraphs.map(function(paragraph) {
      return paragraph.trim();
    });
    paragraphs = addModelAndSerialNumberTo(paragraphs);
    paragraphs = addLocationInformationTo(paragraphs);
    paragraphs = addNameAndAddressTo(paragraphs);
    return paragraphs.join("\n\n");
  };

  renderReverbAttributes = function() {
    var element;
    element = document.createElement("div");
    element.id = "reverb-attributes";
    element.className = "remote attributes";
    element.innerHTML = "<header>Reverb Attributes</header>\n<pre class=\"title\">" + (renderTitleForReverb()) + "</pre>\n<pre class=\"description\">" + (renderTextForReverb()) + "</pre>";
    return document.body.appendChild(element);
  };

  renderTitleForReverb = function() {
    return document.pull("title").innerText.split("$")[0] + ", Canada 🐢";
  };

  renderTextForReverb = function() {
    var paragraphs, pre;
    pre = document.pull("article #summary pre");
    paragraphs = pre.innerText.split("\n\n");
    paragraphs = paragraphs.map(function(paragraph) {
      return paragraph.trim();
    });
    paragraphs = addModelAndSerialNumberTo(paragraphs);
    paragraphs = addLocationInformationTo(paragraphs);
    return paragraphs.join("\n\n");
  };

  Location_Information = "We are located in the Little Italy area of Ottawa and we are usually available on weekday afternoons and evenings — let us know what might work best for you and we will get back to you shortly.";

  Name_And_Address = "Painted Turtle Instruments\nhttps://paintedturtle.xyz/instruments";

  addModelAndSerialNumberTo = function(paragraphs) {
    var make_and_model, manufactured, preamble, serial;
    preamble = [];
    if (make_and_model = document.pull(".make.model")) {
      preamble.push(make_and_model.innerText);
    }
    if (manufactured = document.pull(".manufactured")) {
      preamble.push(manufactured.innerText);
    }
    if (serial = document.pull(".serial")) {
      preamble.push(serial.innerText);
    }
    if (preamble.length) {
      preamble = [preamble.join("\n")];
    }
    return preamble.concat(paragraphs);
  };

  addLocationInformationTo = function(paragraphs) {
    var indexOfContactInfo, output;
    output = [].concat(paragraphs);
    indexOfContactInfo = paragraphs.findIndex(function(paragraph) {
      return /Send us a message/.test(paragraph);
    });
    if (paragraphs[indexOfContactInfo]) {
      output[indexOfContactInfo] = paragraphs[indexOfContactInfo] + " " + Location_Information;
    } else {

    }
    return output;
  };

  addNameAndAddressTo = function(paragraphs) {
    return [].concat(paragraphs).concat(Name_And_Address);
  };

}).call(this);
