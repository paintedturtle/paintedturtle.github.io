document.on "DOMContentLoaded", (event) ->
	document.query("a.window").forEach(resizeWindow)

window.onresize  = ->
	document.query("a.window").forEach(resizeWindow)
		
resizeWindow = (aWindow) ->
	aWindow.style.width = "25%"
	aWindow.style.height = (window.innerHeight * (1/2)) + "px"