<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Homepage" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <title>Demo &raquo; Custom drag handle &raquo; gridster.js</title>
    <link rel="stylesheet" type="text/css" href="../Style/gridster.css" />
    <link rel="stylesheet" type="text/css" href="../Style/test.css" />
    <script type="text/javascript" src="../Scripts/jquery-2.1.4.js"></script>
    <script src="../Scripts/gridster.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="../Scripts/Chart.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui-1.11.4.js"></script>
    <script type="text/javascript" src="../Scripts/CreateNewWidget.js"></script>
    <script type="text/javascript" src="../Scripts/CreateNewChart.js"></script>
    <!-- <script type="text/javascript" src="../Scripts/snap_grid.js"></script> -->
</head>
<body>
    <style>
        
        .deleteWidgetDiv {
            background: #999;
            float: right;
            font-size: 12px;
            padding: 4px 4px 0px ;
            cursor: pointer;
        }
        .gridster li header .dragDiv {
            background: #AAA;
            font-size: 12px;
            display: block;
            padding: 4px 0 0px ;
            cursor: move;
        }
    </style>
    <div>
        <form runat ="server">
            <p>Add new widget:</p>

            <button id="addWidgetButton">Add widget</button>
        </form>
    </div>
    <div class="gridster">
        <ul>

        </ul>
    </div>

    <script>
        var count = 0;
        var gridster;

        $(function () {

            gridster = $(".gridster ul").gridster({
                widget_base_dimensions: [200, 200],
                widget_margins: [5, 5],
                helper: 'clone',
                avoid_overlapped_widgets: true,
                draggable: {
                    handle: '.dragDiv'
                }
            }).data('gridster');

            $(document).on("click", "#addWidgetButton", function (e) {
                e.preventDefault();

                addNewWidget(count);
                
                //gridster.add_widget.apply(gridster, [wid, 3, 2]);

                //var ctx2 = document.getElementById(can.id).getContext("2d");
               // var myLines = new Chart(ctx2).Line(data);

                count = count + 1;

            });

            $(document).on("click", ".deleteWidgetDiv", function () {
                $(this).closest("li").addClass("activ");
                gridster.remove_widget($('.activ'));
            });


        });
        
    </script>
</body>
</html>
