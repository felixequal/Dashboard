var randomScalingFactor = function () { return Math.round(Math.random() * 100) };

var barChartData = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
    {
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,0.8)",
        highlightFill: "rgba(220,220,220,0.75)",
        highlightStroke: "rgba(220,220,220,1)",
        data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
    },
    {
        fillColor: "rgba(151,187,205,0.5)",
        strokeColor: "rgba(151,187,205,0.8)",
        highlightFill: "rgba(151,187,205,0.75)",
        highlightStroke: "rgba(151,187,205,1)",
        data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
    }
    ]
}

var doughnutData = [
{
    value: 300,
    color: "#F7464A",
    highlight: "#FF5A5E",
    label: "Red"
},
{
    value: 50,
    color: "#46BFBD",
    highlight: "#5AD3D1",
    label: "Green"
},
{
    value: 100,
    color: "#FDB45C",
    highlight: "#FFC870",
    label: "Yellow"
},
{
    value: 40,
    color: "#949FB1",
    highlight: "#A8B3C5",
    label: "Grey"
},
{
    value: 120,
    color: "#4D5360",
    highlight: "#616774",
    label: "Dark Grey"
}
];

var data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
    {
        label: "My First dataset",
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,0.8)",
        highlightFill: "rgba(220,220,220,0.75)",
        highlightStroke: "rgba(220,220,220,1)",
        data: [65, 59, 80, 81, 56, 55, 40]
    },
    {
        label: "My Second dataset",
        fillColor: "rgba(151,187,205,0.5)",
        strokeColor: "rgba(151,187,205,0.8)",
        highlightFill: "rgba(151,187,205,0.75)",
        highlightStroke: "rgba(151,187,205,1)",
        data: [28, 48, 40, 19, 86, 27, 90]
    }
    ]
};
Chart.defaults.global.responsive = true;
window.onload = function () {
    var ctx = document.getElementById("canvas1").getContext("2d");
    var myLine = new Chart(ctx).Line(data);
    var ctx_donut = document.getElementById("canvas2").getContext("2d");
    window.myDoughnut = new Chart(ctx_donut).Doughnut(doughnutData);
    var ctx_bar = document.getElementById("canvas3").getContext("2d");
    window.myBar = new Chart(ctx_bar).Bar(barChartData);
}
