var chartHold = [];

function addNewWidget(count, gridster) {

    var wid = document.createElement("li");
    wid.className = "widget";
    wid.id = "Li" + count;
    var head = document.createElement("header");

    var deletewid = document.createElement("div");
    deletewid.classList.add("deleteWidgetDiv");
    deletewid.innerHTML = "X";

    var dragwid = document.createElement("div");
    dragwid.classList.add("dragDiv");
    dragwid.id = "GraphLabel"+count;
    dragwid.innerHTML = "&nbsp;";

    var selectionBoxes = document.createElement("div");
    selectionBoxes.id = "div" + count;
    selectionBoxes.className = "menu-holder";
    selectionBoxes.setAttribute('data-id', count);
    selectionBoxes.style.width = "530px";
    selectionBoxes.style.height = "310px";

    var menuPopup = document.createElement("div");
    menuPopup.className = "task__actions";
    menuPopup.id = "divMenu" + count;

    var list1 = document.createElement("i");
    list1.className = "edit-Widget";

    var list2 = document.createElement("i");
    list2.className = "delete-Widget";

    // Label and Select 1
    var Label1 = document.createElement("label");
    Label1.id = "Label1-" + count;
    Label1.innerHTML = "Select a Project:<br/>";

    var select1 = document.createElement("select");
    select1.id = "Select1-" + count;
    select1.onchange = function(){Select1(count) };

   
    head.appendChild(deletewid);
    head.appendChild(dragwid);
    wid.appendChild(head);
    menuPopup.appendChild(list1);
    menuPopup.appendChild(list2);
    selectionBoxes.appendChild(menuPopup);
    selectionBoxes.appendChild(Label1);
    selectionBoxes.appendChild(select1);
    wid.appendChild(selectionBoxes);
    
    gridster.add_widget.apply(gridster, [wid, 2, 2]);
   
    AddSelectOptions(["Aquaponics", "Biodiesel", "Compost", "Energy", "Vermiculture"], "Select1-" + count);

}
function widgetElementCreator(type, count, slNumber, labels) {

    // Creates Select and Label based on input parameters
    var divHold = document.getElementById("div" + count);
    
    if (type == "canvas") {
        var Label = document.createElement("label");
        Label.id = "LabelCanvas-" + count;
        Label.innerHTML = labels;

        var canvasDiv = document.createElement("div");
        canvasDiv.style.width = "530px";
        canvasDiv.style.height = "290px"

        var canvas = document.createElement("canvas");
        canvas.id = "Canvas-" + count;
        canvasDiv.appendChild(canvas)

        divHold.appendChild(Label);
        divHold.appendChild(canvasDiv);
    }else{
    
        var Label = document.createElement("label");
        Label.id = "Label" + slNumber + "-" + count;
        Label.innerHTML = labels;
        divHold.appendChild(Label);
    

        var element = document.createElement(type);
        type = type.charAt(0).toUpperCase() + type.substr(1);
        element.id = type + "" + slNumber + "-" + count;
        if (type == "Select" || type == "Input") {
            element.onchange = function () { window[type + "" + slNumber](count) };
        }
        if (type == "Button") {
            element.onclick = function () { window[type + "" + slNumber](count) };
        }
        divHold.appendChild(element);
    }
}


function AddSelectOptions(options, selectName) {
    //Get the Select inorder to add options
    var select = document.getElementById(selectName);

    // Add Starting Options
    var optionSelect = document.createElement("option");
    optionSelect.text = "--Select--";
    optionSelect.value = "None";
    select.add(optionSelect, select[0]);

    // Add Passed in Options
    for (i = 0; i < options.length; i++) {
        optionSelect = document.createElement("option");
        optionSelect.text = options[i];
        optionSelect.value = options[i];
        select.add(optionSelect, select[i+1]);
    }
}

function Select1(count) {

    //Reset Seleect Menu
   resetFollowing("Select1-" + count);

    // Get the Value of Select1   
    var selectHold = document.getElementById("Select1-" + count);
    var value = selectHold.options[selectHold.selectedIndex].value;

    switch(value){
        case "Compost":
            //Get the object Label and Select 2
            widgetElementCreator("select", count, 2, "<br/>Select type of waste:<br/>");
            AddSelectOptions(["Foodwaste - By Vendor", "Foodwaste - By Type of Waste", "Hot Compost", "Vegtable Oil"], "Select2-" + count);
            break;
    }

}
function Select2(count) {
    //Reset Seleect Menu
    resetFollowing("Select2-" + count);

    // Get the Value of Select2   
    var selectHold = document.getElementById("Select2-" + count);
    var value = selectHold.options[selectHold.selectedIndex].value;

    switch (value) {
        //Compost Selection 
        case ("Foodwaste - By Vendor"):
            widgetElementCreator("select", count, 3, "<br/>Select Vendor:<br/>");
            getDBData("Foodwaste - By Vendor", function(callback) {
                AddSelectOptions(callback, "Select3-" + count);
            });
            break;
        case ("Foodwaste - By Type of Waste"):
            widgetElementCreator("select", count, 3, "<br/>Select Type of Waste:<br/>");
            AddSelectOptions(["Coffee Grounds", "Dairy", "Fruit", "Grains", "Paper", "Vegetables"], "Select3-" + count);
            break;
        case "Hot Compost":
            break;
        case "Vegetable Oil":
            break;

        // Aquponics Section            
    }
}


function Select3(count) {

    //Reset Seleect Menu
    resetFollowing("Select3-" + count);

    // Get the Value of Select2   
    var selectHold = document.getElementById("Select2-" + count);
    var value = selectHold.options[selectHold.selectedIndex].value;

    switch (value) {
        //Compost Selection 
        case "Foodwaste - By Vendor":
            widgetElementCreator("select",count, 4,"<br/>Select the type of graph you would like to create:<br/>");
            AddSelectOptions(["Bar Chart", "Donut Chart", "Line Chart", "Pie Chart"], "Select4-" + count);
            break;
        case "Foodwaste - By Type of Waste":
            widgetElementCreator("select", count, 4, "<br/>Select the type of graph you would like to create:<br/>");
            AddSelectOptions(["Bar Chart", "Line Chart"], "Select4-" + count);
            break;
    }

}
function Select4(count) {
    //Reset Seleect Menu
    resetFollowing("Select4-" + count);

    var selectHold2 = document.getElementById("Select2-" + count);
    var value2 = selectHold2.options[selectHold2.selectedIndex].value;

    var selectHold3 = document.getElementById("Select3-" + count);
    var value3 = selectHold3.options[selectHold3.selectedIndex].value;

    var selectHold4 = document.getElementById("Select4-" + count);
    var value4 = selectHold4.options[selectHold4.selectedIndex].value;


    if ((value4 == "Donut Chart"|| value4 == "Pie Chart") && value2 == "Foodwaste - By Vendor") {

        widgetElementCreator("select", count, 5, "<br/>Select one of the following dates:<br/>");
        getDBDataDates("GetVendorDates", value3, "01/01/0001", "01/01/0001", function (callbackDate) {
            AddSelectOptions(callbackDate, "Select5-" + count);
        });
    }
    if ((value4 == "Line Chart" || value4 == "Bar Chart") && value2 == "Foodwaste - By Vendor") {
        widgetElementCreator("input", count, "BegInput","<br/>Please select a beginning date:<br/>");
        $("#InputBegInput-" + count).datepicker({ dateFormat: 'yy-mm-dd'});
    }
    if ( value2 == "Foodwaste - By Type of Waste") {
        widgetElementCreator("input", count, "BegInput", "<br/>Please select a beginning date:<br/>");
        $("#InputBegInput-" + count).datepicker({ dateFormat: 'yy-mm-dd' });
    }
}
function Select5(count) {

    //Reset Seleect Menu
    resetFollowing("Select5-" + count);

    var selectHold2 = document.getElementById("Select2-" + count);
    var value2 = selectHold2.options[selectHold2.selectedIndex].value;

    if (value2 == "Foodwaste - By Vendor") {

        var selectHold4 = document.getElementById("Select4-" + count);
        var value4 = selectHold4.options[selectHold4.selectedIndex].value;

        if (value4 == "Pie Chart" || value4 == "Donut Chart") {
            widgetElementCreator("button", count, "Button","<br/>");

            var buttonBeg = document.getElementById("ButtonButton-" + count);
            buttonBeg.readOnly = true;
            buttonBeg.innerHTML = "Create Chart";
            buttonBeg.setAttribute('type', 'button');
        }
    }
}
function Select6() {

}
function InputBegInput(count) {

    resetFollowing("InputBegInput-" + count);
    widgetElementCreator("input", count, "EndInput","<br/>Please select a ending date:<br/>");
    $("#InputEndInput-" + count).datepicker({ dateFormat: 'yy-mm-dd' });
}


function InputEndInput(count) {
    resetFollowing("InputEndInput-" + count);
    widgetElementCreator("button", count, "Button","<br/>");
    var buttonBeg = document.getElementById("ButtonButton-" + count);
    buttonBeg.readOnly = true;
    buttonBeg.innerHTML = "Create Chart";
    buttonBeg.setAttribute('type', 'button');
}

// button on click 
function ButtonButton(count) {
    resetFollowing("ButtonButton-" + count);
    var selectHold1 = document.getElementById("Select1-" + count);
    var value1 = selectHold1.options[selectHold1.selectedIndex].value;

    if (value1 == "Compost") {
        var selectHold2 = document.getElementById("Select2-" + count);
        var value2 = selectHold2.options[selectHold2.selectedIndex].value;

        if (value2 == "Foodwaste - By Vendor") {
            var selectHold3 = document.getElementById("Select3-" + count);
            var value3 = selectHold3.options[selectHold3.selectedIndex].value;

            var selectHold4 = document.getElementById("Select4-" + count);
            var value4 = selectHold4.options[selectHold4.selectedIndex].value;

            if (value4 == "Pie Chart" || value4 == "Donut Chart") {

                var selectHold5 = document.getElementById("Select5-" + count);
                var value5 = selectHold5.options[selectHold5.selectedIndex].value;

                getDBDataDates("Foodwaste - By Vendor", value3, value5, "01/01/0001", function (callbackDate) {
                    widgetElementCreator("canvas", count, "", value3 + " foodwaste collected on " + value5);

                    var canvas = document.getElementById("Canvas-" + count);
                   
                    if (chartHold[count]) {
                        chartHold[count].destroy();
                    }
                    var newGraph = canvas.getContext("2d"); //get html5 canvas 2d element.
                    var arr = [];
                    $.each(callbackDate, function (inx, val) {
                        var obj = {};
                        obj.color = val.color;
                        obj.value = val.value;
                        obj.label = val.label;
                        arr.push(obj);
                    });
                    var options = {
                        responsive: true,
                        maintainAspectRatio: false,
                        multiTooltipTemplate: "<%= datasetLabel %> - <%= value %>"
                    };
                    if (value4 == 'Donut Chart') {
                        chartHold[count] = new Chart(newGraph).Doughnut(arr,options); //draw a chart.js chart on the 2d element.
                        
                    } else {
                        chartHold[count] = new Chart(newGraph).Pie(arr,options); //draw a chart.js chart on the 2d element.
                    }
                });
                hideFormAfterGraph(count);
            }
            if (value4 == "Line Chart" || value4 == "Bar Chart") {
                var begInput = document.getElementById("InputBegInput-" + count);
                var endInput = document.getElementById("InputEndInput-" + count);

                var li = document.getElementById("Li" + count);
                //li.

                getDBDataDates("Foodwaste - by Vendor Line/Bar", value3, begInput.value, endInput.value, function (callbackDate) {
                    widgetElementCreator("canvas", count, "", value3 + " foodwaste collected between " + begInput.value + " and " + endInput.value);

                    var canvas = document.getElementById("Canvas-" + count);

                    if (chartHold[count]) {
                        chartHold[count].destroy();
                    }

                    var newGraph = canvas.getContext("2d"); //get html5 canvas 2d element.
                    if (value4 == 'Line Chart') {

                        var labels = callbackDate[0];
                        var shiftedData = callbackDate.shift();

                        var arr = [];
                        $.each(callbackDate, function (inx, val) {
                            var obj = {};
                            obj.label = val.label;
                            obj.fillColor = val.fillColor;
                            obj.strokeColor = val.strokeColor;
                            obj.pointColor = val.pointColor;
                            obj.pointStrokeColor = val.pointStrokeColor;
                            obj.pointHighlightFill = val.pointHighlightFill;
                            obj.pointHighlightStroke = val.pointHighlightStroke;
                            obj.data = val.data;
                            arr.push(obj);
                        });

                        var obj = {
                            labels: labels,
                            datasets: arr
                        };
                        var options = {
                            responsive: true,
                            maintainAspectRatio: false,
                            multiTooltipTemplate: "<%= datasetLabel %> - <%= value %>"
                        };
                        chartHold[count] = new Chart(newGraph).Line(obj, options); //draw a chart.js chart on the 2d element.
                    }
                    if (value4 == 'Bar Chart') {

                        var labels = callbackDate[0];
                        var shiftedData = callbackDate.shift();

                        var arr = [];
                        $.each(callbackDate, function (inx, val) {
                            var obj = {};
                            obj.label = val.label;
                            obj.fillColor = val.pointColor;
                            obj.strokeColor = val.strokeColor;
                            obj.highlightFill = val.fillColor;
                            obj.highlightStroke = val.pointHighlightStroke;
                            obj.data = val.data;
                            arr.push(obj);
                        });

                        var obj = {
                            labels: labels,
                            datasets: arr
                        };
                        var options = {
                            responsive: true,
                            maintainAspectRatio: false,
                            multiTooltipTemplate: "<%= datasetLabel %> - <%= value %>"
                        };
                        chartHold[count] = new Chart(newGraph).Bar(obj, options); //draw a chart.js chart on the 2d element.
                    }
                    
                });
                   
                hideFormAfterGraph(count);
            }

        }
        if (value2 == "Foodwaste - By Type of Waste") {

            var selectHold3 = document.getElementById("Select3-" + count);
            var value3 = selectHold3.options[selectHold3.selectedIndex].value;

            var selectHold4 = document.getElementById("Select4-" + count);
            var value4 = selectHold4.options[selectHold4.selectedIndex].value;

            var begInput = document.getElementById("InputBegInput-" + count);
            var endInput = document.getElementById("InputEndInput-" + count);

            var li = document.getElementById("Li" + count);

            getDBDataDates("Foodwaste - by Type of Waste Line/Bar", value3, begInput.value, endInput.value, function (callbackDate) {
                widgetElementCreator("canvas", count, "", value3 + " foodwaste collected between " + begInput.value + " and " + endInput.value);

                var canvas = document.getElementById("Canvas-" + count);

                if (chartHold[count]) {
                    chartHold[count].destroy();
                }

                var newGraph = canvas.getContext("2d"); //get html5 canvas 2d element.
                if (value4 == 'Line Chart') {

                    var labels = callbackDate[0];
                    var shiftedData = callbackDate.shift();

                    var arr = [];
                    $.each(callbackDate, function (inx, val) {
                        var obj = {};
                        obj.label = val.label;
                        obj.fillColor = val.fillColor;
                        obj.strokeColor = val.strokeColor;
                        obj.pointColor = val.pointColor;
                        obj.pointStrokeColor = val.pointStrokeColor;
                        obj.pointHighlightFill = val.pointHighlightFill;
                        obj.pointHighlightStroke = val.pointHighlightStroke;
                        obj.data = val.data;
                        arr.push(obj);
                    });

                    var obj = {
                        labels: labels,
                        datasets: arr
                    };
                    var options = {
                        responsive: true,
                        maintainAspectRatio: false,
                        multiTooltipTemplate: "<%= datasetLabel %> - <%= value %>"
                    };
                    chartHold[count] = new Chart(newGraph).Line(obj, options); //draw a chart.js chart on the 2d element.
                }
                if (value4 == 'Bar Chart') {

                    var labels = callbackDate[0];
                    var shiftedData = callbackDate.shift();

                    var arr = [];
                    $.each(callbackDate, function (inx, val) {
                        var obj = {};
                        obj.label = val.label;
                        obj.fillColor = val.pointColor;
                        obj.strokeColor = val.strokeColor;
                        obj.highlightFill = val.fillColor;
                        obj.highlightStroke = val.pointHighlightStroke;
                        obj.data = val.data;
                        arr.push(obj);
                    });

                    var obj = {
                        labels: labels,
                        datasets: arr
                    };
                    var options = {
                        responsive: true,
                        maintainAspectRatio: false,
                        multiTooltipTemplate: "<%= datasetLabel %> - <%= value %>"
                    };
                    chartHold[count] = new Chart(newGraph).Bar(obj, options); //draw a chart.js chart on the 2d element.
                }

            });

            hideFormAfterGraph(count);
        }
    }
}
//Ajax query to db to get all of the current projects
function getDBData(data, callback) {
    var stringfy = "{data: '" + data + "'}";
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "Service.asmx/returnData",
        data: stringfy, 
        contentType: "application/json; charset=utf-8",
        error: function () { window.alert("ERROR IN GETPROJECTS"); },
        success: function (response) {
            var returned = response.d;
            callback(returned);
        }
    });
}


function getDBDataDates(param1, param2, datebeg, dateend, callbackDate) {
    var stringfy = "{param1: '" + param1 + "', param2:'" + param2 + "', dateBeg: '" + datebeg + "', dateEnd: '" + dateend + "'}";
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "Service.asmx/returnDataDates",
        data: stringfy,
        contentType: "application/json; charset=utf-8",
        error: function () { window.alert("ERROR IN GETPROJECTS"); },
        success: function (response) {
            var returned = response.d;
            callbackDate(returned);
        }
    });
}

function hideFormAfterGraph(count) {
   
    $("#div"+count).find("select").hide();
    $("#div" + count).find("label").hide();
    $("#div" + count).find("button").hide();
    $("#div" + count).find("input").hide();
}

function editWidget(count) {
    $("#div" + count).find("#LabelCan-"+count).remove();
    $("#div" + count).find("canvas").remove();

    $("#div" + count).find("select").show();
    $("#div" + count).find("label").show();
    $("#div" + count).find("button").show();
    $("#div" + count).find("input").show();
    
}
function resetFollowing(current) {
    
    $("#"+current).nextAll().remove();
}
