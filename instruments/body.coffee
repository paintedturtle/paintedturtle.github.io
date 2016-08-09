window.on "resize", -> renderBody()
document.on "DOMContentLoaded", -> renderBody()

renderBody = ->
  document.body.classList.toggle("portrait", window.innerHeight is window.innerWidth)
  document.body.classList.toggle("portrait", window.innerHeight > window.innerWidth)
  document.body.classList.toggle("landscape", window.innerHeight < window.innerWidth)
  document.body.classList.toggle("initialized", yes)
