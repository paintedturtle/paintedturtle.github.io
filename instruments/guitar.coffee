document.on "DOMContentLoaded", window.onresize = (event) ->
	document.query("#remotes a.window").forEach(resizeRemoteWindow)
	document.query("#information a.window").forEach(resizeLinkedWindow)
	document.query("#comparison a.window").forEach(resizeLinkedWindow)

resizeLinkedWindow = (aWindow) ->
	console.info linked:aWindow
	aWindow.style.width = "25%"
	widthInPixels = Number((getComputedStyle(aWindow).width).replace("px",""))
	aWindow.style.height = Math.max(window.innerHeight/window.innerWidth, 0.66) * widthInPixels + "px"

resizeRemoteWindow = (aWindow) ->
	aWindow.style.width = "100%"
	widthInPixels = Number((getComputedStyle(aWindow).width).replace("px",""))
	aWindow.style.height = Math.max(window.innerHeight/window.innerWidth, 0.66) * widthInPixels + "px"
