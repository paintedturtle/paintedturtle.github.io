document.on "DOMContentLoaded", window.onresize = (event) ->
	document.query("svg.price").forEach(renderPriceTag)

renderPriceTag = (svg) ->
	output = d3.select(svg)
	output.attr viewbox:"0 0 300 300"

	circle = output.append("circle")
	circle.attr cx:150, cy: 150, r:125, "stroke-width":"0.66", stroke:"black"
	circle.attr fill:"hsl(270, 33%, 30%)"

	bigText = output.append("text")
		.attr "class":"large numbers"
		.text "3"
		.attr "x":150, "y":205, "font-size":"150px", "fill":"white", "text-anchor":"middle", "font-weight":700, "letter-spacing":"0"

	{width, height} = bigText.node().getBBox()

	zeros = output.append("text")
		.text "00"
		.attr "class":"small zeros"
		.attr "x":(300/2)+(width/2), "y":165, "font-size":"60px", "fill":"white", "text-anchor":"middle", "font-weight":200, "letter-spacing":"-5px"

	symbol = output.append("text")
		.text "$"
		.attr "class":"small currency symbol"
		.attr "x":(300/2)-(width/2), "y":165, "font-size":"60px", "fill":"white", "text-anchor":"middle", "font-weight":200, "letter-spacing":"0px"
