function addNewWidget(count) {

    var wid = document.createElement("li");
    var head = document.createElement("header");

    var deletewid = document.createElement("div");
    deletewid.classList.add("deleteWidgetDiv");
    deletewid.innerHTML = "X";

    var dragwid = document.createElement("div");
    dragwid.classList.add("dragDiv");
    dragwid.innerHTML = "Line Chart";

    var selectionBoxes = document.createElement("div");
    selectionBoxes.id = "div" + count;

    var selectChartTypeLabel = document.createElement("label");
    selectChartTypeLabel.id = "ChartSelectLab" + count;
    selectChartTypeLabel.innerHTML = "<br/>Select the type Chart for this Widget:  ";

    var selectChartType = document.createElement("select");
    selectChartType.id = "ChartSelect" + count;
    selectChartType.onchange = function(){ChartTypeSelected(count)};

    var selectProjectLabel = document.createElement("label");
    selectProjectLabel.id = "ProjectSelectLab" + count;
    selectProjectLabel.innerHTML = "<br/>Please Select a Project:  ";
    selectProjectLabel.hidden = true;

    var selectProject = document.createElement("select");
    selectProject.id = "ProjectSelect" + count;
    selectProject.onchange = function(){ProjectSelected(count)};
    selectProject.hidden = true; 

    var selectDataLabel = document.createElement("label");
    selectDataLabel.id = "DataSelectLab" + count;
    selectDataLabel.innerHTML = "<br/>Please select data to view from this project:  ";
    selectDataLabel.hidden = true;

    var selectData = document.createElement("select");
    selectData.id = "DataSelect" + count;
    selectData.onchange = function(){DataSelected(count)};
    selectData.hidden = true; 

    var button = document.createElement("button");
    button.id = "Button" + count;
    button.innerHTML = "Create Chart";
    button.hidden = true;
    button.onclick = function () { ButtonOnClick(count)};

    var can = document.createElement("canvas");
    can.id = "canvas" + count;
    can.innerHTML = "this is me no graph";

    head.appendChild(deletewid);
    head.appendChild(dragwid);
    wid.appendChild(head);
    selectionBoxes.appendChild(selectChartTypeLabel);
    selectionBoxes.appendChild(selectChartType);
    selectionBoxes.appendChild(selectProjectLabel);
    selectionBoxes.appendChild(selectProject);
    selectionBoxes.appendChild(selectDataLabel);
    selectionBoxes.appendChild(selectData);
    selectionBoxes.appendChild(button);
    wid.appendChild(selectionBoxes);
    wid.appendChild(can);

    gridster.add_widget.apply(gridster, [wid, 3, 2]);

    var addBR = document.getElementById("div" + count);
    addBR.insertBefore(document.createElement("br"), document.getElementById("Button" + count));

    createWidgetSelection("ChartSelect" + count);
}

function createWidgetSelection(selectName) {
    var optionSelect = document.createElement("option");
    optionSelect.text = "--Select--";
    optionSelect.value = "None";

    var optionBar = document.createElement("option");
    optionBar.text = "Bar Chart";
    optionBar.value = "Bar Chart";

    var optionDonut = document.createElement("option");
    optionDonut.text = "Donut Chart";
    optionDonut.value = "Donut Chart";

    var optionLine = document.createElement("option");
    optionLine.text = "Line Chart";
    optionLine.value = "Line Chart";

    var optionPie = document.createElement("option");
    optionPie.text = "Pie Chart";
    optionPie.value = "Pie Chart";

    var select = document.getElementById(selectName);
    select.add(optionSelect,select[0]);
    select.add(optionBar, select[1]);
    select.add(optionDonut, select[2]);
    select.add(optionLine, select[3]);
    select.add(optionPie, select[4]);
}
// On Change Chart Select
function ChartTypeSelected(count) {

    var chartType = document.getElementById("ChartSelect" + count);
    var selectedType = chartType.options[chartType.selectedIndex].value;

    var projSelectLab = document.getElementById("ProjectSelectLab" + count);
    var projSelect = document.getElementById("ProjectSelect" + count);
    // Clear all options
    projSelect.options.length = 0;

    if (selectedType != "None") {
        getCurrentProjects(count);
        projSelectLab.hidden = false;
        projSelect.hidden = false;
    } else {
        projSelectLab.hidden = true;
        projSelect.hidden = true;
    }
}
// on Change Project Select
function ProjectSelected(count) {

    var projSelect = document.getElementById("ProjectSelect" + count);
    var selectedValue = projSelect.options[projSelect.selectedIndex].value;
    var dataSelect = document.getElementById("DataSelect" + count);
    var dataSelectLab = document.getElementById("DataSelectLab" + count);

    dataSelect.options.length = 0;

    var option = document.createElement("option");
    option.text =  "--Select--";
    option.value = "None";
    dataSelect.add(option, dataSelect[0]);

    if (selectedValue == "Aquaponics")
    {
        option = document.createElement("option");
        option.text =  "Chemical Levels";
        option.value = "Chemical Levels";
        dataSelect.add(option, dataSelect[1]);

        option = document.createElement("option");
        option.text =  "Fish Stats";
        option.value = "Fish Stats";
        dataSelect.add(option, dataSelect[2]);

    }
    else if (selectedValue == "Compost")
    {
        option = document.createElement("option");
        option.text = "Foodwaste - Weights";
        option.value = "Foodwaste - Weights";
        dataSelect.add(option, dataSelect[1]);

        option = document.createElement("option");
        option.text = "Foodwaste - Percentages";
        option.value = "Foodwaste - Percentages";
        dataSelect.add(option, dataSelect[2]);
    }
    dataSelectLab.hidden = false;
    dataSelect.hidden = false;

}
//on change Data Select
function DataSelected(count) {
    var button = document.getElementById("Button" + count);
    button.hidden = false;
}
// button on click 
function ButtonOnClick(count) {

    var type = document.getElementById("ChartSelect" + count);
    var typeValue = type.options[type.selectedIndex].value;

    var project = document.getElementById("ProjectSelect" + count);
    var projectValue = project.options[project.selectedIndex].value;
    var data = document.getElementById("DataSelect" + count);
    var dataValue = data.options[data.selectedIndex].value;
    createNewChart(typeValue, projectValue, dataValue, count);
    hideAll(count);
}
//Ajax query to db to get all of the current projects
function getCurrentProjects(count) {
    var stringfy = "{count: " + count + "}";
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "Service.asmx/returnProjects",
        data: stringfy, //Even if we are sending no parameters/objects to the webmethod you MUST define an empty dataset here
        contentType: "application/json; charset=utf-8",
        error: getProjectError,
        success: getProjectSuccess,
    });
}
function getProjectError() {
    window.alert("ERROR IN GETPROJECTS");
}
function getProjectSuccess(response) {
    var data = response.d;
    var count = data[0];
    var projSelect = document.getElementById("ProjectSelect" + count);
    //recreate all options
    var option = document.createElement("option");
    option.text = "--Select--";
    option.value = "None";
    projSelect.appendChild(option);
    for (i = 1; i < data.length; i++) {
        option = document.createElement("option");
        option.text = data[i];
        option.value = data[i];
        projSelect.appendChild(option);
    }
}
function hideAll(count) {
    var typeLab = document.getElementById("ChartSelectLab" + count);
    typeLab.hidden = true;
    var type = document.getElementById("ChartSelect" + count);
    type.hidden = true;

    var projectLab = document.getElementById("ProjectSelectLab" + count);
    projectLab.hidden = true;
    var project = document.getElementById("ProjectSelect" + count);
    project.hidden = true;

    var dataLab = document.getElementById("DataSelectLab" + count);
    dataLab.hidden = true;
    var data = document.getElementById("DataSelect" + count);
    data.hidden = true;

    var button = document.getElementById("Button" + count);
    button.hidden = true;
}