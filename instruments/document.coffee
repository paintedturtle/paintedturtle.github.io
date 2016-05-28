document.pull = document.querySelector

document.query = (selector) ->
  Array.from(document.querySelectorAll(selector))

document.on = (eventname, selector, procedure) ->
  if selector instanceof Function
    procedure = selector
    selector = undefined
  if selector
    wrapped = (event) ->
      if element = event.target.closest(selector)
        procedure(event, element)
  else
    wrapped = procedure
  document.addEventListener eventname, wrapped

document.on "DOMContentLoaded", ->
  console.info "document object model is ready":performance.now()

document.on "DOMContentLoaded", ->
  document.query("a[href]").forEach (hyperlink) ->
    if hyperlink.href.toString().match("http:")
      hyperlink.setAttribute "href", hyperlink.href.toString() + ".html"
      console.info hyperlink.href
