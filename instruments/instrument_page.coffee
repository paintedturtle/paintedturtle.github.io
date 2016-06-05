document.on "DOMContentLoaded", ->
  if window.location.pathname.match("/instruments/*")
    identifier = window.location.pathname.split("/").pop().replace(".html", "")
    renderInstrumentPage
      instrument: window.instruments.find (instrument) -> instrument.identifier is identifier
      title: document.pull("title")
      body: document.pull("body")


renderInstrumentPage = (params) ->
  {instrument, title, body} = params

  title.innerText = "#{instrument.make} #{instrument.model} #{instrument.function} in Ottawa 🐢"

  header = d3.select("body > article").append("header")
  header.html """
    <h1>#{instrument.make} #{instrument.model} #{instrument.function}</h1>
    <div style="opacity:0.5;">Manufactured in #{instrument["year"]}</div>
    <div style="opacity:0.5;">Serial ##{instrument["serial number"]}</div>
  """

  cover = d3.select("body > article").append("figure").attr(id:"cover")
  cover.html """
    <img src="/instruments/#{instrument.identifier}/cover.jpg">
    <div class="price d2" style="background:hsl(270, 33%, 30%);"><big><a>$</a><b>#{instrument.price}</b></big><small><a>.</a><b>00</b></small></div>
  """

  summary = d3.select("body > article").append("div").attr(id:"summary")
  summary.append("pre").html instrument.summary
