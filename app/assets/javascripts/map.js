$(function() {

  var w = 1300;
  var h = 700;

  var projection = d3.geo.albersUsa()
      .translate([w/2, h/2])
      .scale([1300]);

  var path = d3.geo.path()
      .projection(projection);

  var svg = d3.select(".container")
      .append("svg")
      .attr("width", w)
      .attr("height", h);

  d3.json("us-states.json", function(json) {
    svg.selectAll("path")
        .data(json.features)
        .enter()
        .append("path")
        .attr("d", path)
        .classed("neutral", true)
        .on("click", click);
  });

  function click(d) {
    if (this.classList == "neutral") {
      d3.select(this)
          .classed({"neutral": false, "blue": true})
    } else if (this.classList == "blue") {
      d3.select(this)
          .classed({"blue": false, "red": true})
    } else {
      d3.select(this)
          .classed({"red": false, "neutral": true})
    }
  };

})
