if location.hostname is "paintedturtle.dev"
  document.on "DOMContentLoaded", (event) ->
    renderDocumentAttributes()
    renderKijijiAttributes()
    renderReverbAttributes()

# document attributes

renderDocumentAttributes = ->
  element = document.createElement("div")
  element.id = "document-attributes"
  element.className = "remote attributes"
  element.innerHTML = """
    <header>Document Attributes</header>
    <pre class="title">#{document.pull("title").innerText}</pre>
    """
  document.body.appendChild(element)

# kijiji attributes

renderKijijiAttributes = ->
  element = document.createElement("div")
  element.id = "kijiji-attributes"
  element.className = "remote attributes"
  element.innerHTML = """
    <header>Kijiji Attributes</header>
    <pre class="title">#{renderTitleForKijiji()}</pre>
    <pre class="description">#{renderTextForKijiji()}</pre>
    """
  document.body.appendChild(element)

renderTitleForKijiji = ->
  document.pull("title").innerText.split("in Ottawa")[0]

renderTextForKijiji = ->
  pre = document.pull("article #summary pre")
  paragraphs = pre.innerText.split("\n\n")
  paragraphs = paragraphs.map (paragraph) -> paragraph.trim()
  paragraphs = addModelAndSerialNumberTo(paragraphs)
  paragraphs = addLocationInformationTo(paragraphs)
  paragraphs = addNameAndAddressTo(paragraphs)
  paragraphs.join("\n\n")

# reverb attributes

renderReverbAttributes = ->
  element = document.createElement("div")
  element.id = "reverb-attributes"
  element.className = "remote attributes"
  element.innerHTML = """
    <header>Reverb Attributes</header>
    <pre class="title">#{renderTitleForReverb()}</pre>
    <pre class="description">#{renderTextForReverb()}</pre>
    """
  document.body.appendChild(element)

renderTitleForReverb = ->
  document.pull("title").innerText.split("$")[0].trim() + ", Canada 🐢"

renderTextForReverb = ->
  pre = document.pull("article #summary pre")
  paragraphs = pre.innerText.split("\n\n")
  paragraphs = paragraphs.map (paragraph) -> paragraph.trim()
  paragraphs = addModelAndSerialNumberTo(paragraphs)
  paragraphs = addCashSavingsTo(paragraphs)
  paragraphs = addLocationInformationTo(paragraphs)
  paragraphs.join("\n\n")

Location_Information = """
  We are located in the Little Italy area of Ottawa and we are usually available on weekday afternoons and evenings. Let us know what might work best for you and we will get back to you shortly.
"""

Name_And_Address = """
  Painted Turtle Instruments
  https://paintedturtle.xyz/instruments
  """

addModelAndSerialNumberTo = (paragraphs) ->
  preamble = []
  if make_and_model = document.pull(".make.model")
    preamble.push make_and_model.innerText
  if manufactured = document.pull(".manufactured")
    preamble.push manufactured.innerText
  if serial = document.pull(".serial")
    preamble.push serial.innerText
  if preamble.length
    preamble = [preamble.join("\n")]
  preamble.concat(paragraphs)

addCashSavingsTo = (paragraphs, output=[]) ->
  indexOfContactInfo = paragraphs.findIndex (paragraph) -> /Send us a message/.test(paragraph)
  if paragraphs[indexOfContactInfo]
    output = output.concat(paragraphs[0...indexOfContactInfo])
    output = output.concat(["Save $1 if you pay with cash instead of purchasing through Reverb."])
    output = output.concat(paragraphs[indexOfContactInfo...paragraphs.length])
  else
    output = output.concat(paragraphs)

addLocationInformationTo = (paragraphs) ->
  output = [].concat(paragraphs)
  indexOfContactInfo = paragraphs.findIndex (paragraph) -> /Send us a message/.test(paragraph)
  if paragraphs[indexOfContactInfo]
    output[indexOfContactInfo] = paragraphs[indexOfContactInfo] + " " + Location_Information
  else
    # nothing to do
  return output

addNameAndAddressTo = (paragraphs) ->
  [].concat(paragraphs).concat(Name_And_Address)
