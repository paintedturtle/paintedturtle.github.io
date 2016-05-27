document.on "DOMContentLoaded", -> renderBody()
window.on "resize", -> renderBody()

renderBody = ->
  document.body.classList.toggle("square", window.innerHeight is window.innerWidth)
  document.body.classList.toggle("portrait", window.innerHeight > window.innerWidth)
  document.body.classList.toggle("landscape", window.innerHeight < window.innerWidth)
  document.body.classList.toggle("initialized", yes)
