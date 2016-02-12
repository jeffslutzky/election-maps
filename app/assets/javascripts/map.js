$(function() {

  var w = 1300;
  var h = 700;

  var projection = d3.geo.albersUsa()
      .translate([w/2, h/2])
      .scale([1500]);

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
    svg.selectAll("text")
        .data(json.features)
        .enter()
        .append("text")
        .attr("transform", function(d) { return "translate(" + path.centroid(d) + ")"; })
        .attr("dy", ".35em")
        .attr("dx", "-.3em")
        .attr("class", "ev")
        .text(function(d) { return d.ev; });
  });

  var blueStates = [];
  var redStates = [];
  var blueEV = 0;
  var redEV = 0;

  function click(d) {
    if (this.classList == "neutral") {
      d3.select(this)
          .classed({"neutral": false, "blue": true});
      blueStates.push(d.properties.name);
      blueEV += d.ev;
    } else if (this.classList == "blue") {
      d3.select(this)
          .classed({"blue": false, "red": true});
      blueStates.splice($.inArray(d.properties.name, blueStates),1);
      blueEV -= d.ev;
      redStates.push(d.properties.name);
      redEV += d.ev;
    } else {
      d3.select(this)
          .classed({"red": false, "neutral": true});
      redStates.splice($.inArray(d.properties.name, redStates),1);
      redEV -= d.ev;
    };
    $("#dems").text(blueEV);
    $("#reps").text(redEV);
  };

})
