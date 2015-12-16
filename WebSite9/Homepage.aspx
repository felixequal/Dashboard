<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Homepage" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <title>STORC Dashboard</title>
        <link rel="stylesheet" type="text/css" href="../Style/gridster.css"/>
        <link rel="stylesheet" type="text/css" href="../Style/Tabs.css" />
        <link rel="stylesheet" type="text/css" href="../Style/colors.css" />
        <link rel="stylesheet" type="text/css" href="../Style/PopUpMenu.css" />
        <link rel="stylesheet" type="text/css" href="../Style/CanvasStyle.css" />
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
        <script type="text/javascript" src="../Scripts/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="../Scripts/gridster.js"></script>
        <script type="text/javascript" src="../Scripts/Chart.js"></script>
        <script type="text/javascript" src="../Scripts/jquery-ui-1.11.4.js"></script>
        <script type="text/javascript" src="../Scripts/CreateNewChart.js"></script>
        <script type="text/javascript" src="../Scripts/CreateNewWidget.js"></script>
        


    </head>
    <style type="text/css">
        .deleteWidgetDiv {
            float: right;
            height: 22px;
            width: 22px;
            margin-left: auto;
            margin-right: auto;
            color: white;
            text-align: center;
            font-family: verdana;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            padding: 4px, 4px, 4px, 4px;
            background-color: rgba(255, 0, 0, 1);
        }
        .dragDiv{
            font-size: 16px;
            font-family: 'Trebuchet MS';
            font-weight:bold;
            text-align: center;
            cursor: move;
        }
        .widget, header  {
            background: #aaaaaa;
            font-family: 'Trebuchet MS';
            font-size: 12px;
            display: block;
        }
        .gridster {
            margin-top: 45px;
            background-color: rgba(238, 233, 233, 0.5);
        }
    </style>

    <body>
    <form id="form1" runat="server">
        <table align="left" border="0">
                <tr>
                    <td>
                        <asp:Button Text="Dashboard" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server" OnClick="Tab1_Click" />
                        <asp:Button Text="Input Data" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server" OnClick="Tab2_Click" />
                        <asp:Button Text="User Group" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server" OnClick="Tab3_Click" />
                    </td>
                </tr>
        </table>
        <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="View1" runat="server"> 
                <div>
                    <br/>
                    <div class="gridster">
                        <ul style = "width: 100%; position: relative; height: auto;">
                        </ul>
                    </div>
                    <div class ="task__actions">
                        <i class ="add-Wigdet"> </i>
                    </div>
                </div>
                <script>
                    var count = 0;
                    var gridster;

                    $(function () {
                        initPopUp();
                        gridster = $(".gridster ul").gridster({
                            widget_base_dimensions: [260, 160],
                            widget_margins: [5, 5],
                            helper: 'clone',
                            /*resize: {
                                enabled: true,
                                max_size: [3, 2],
                                min_size: [2, 1],
                                stop: function (e, ui, $widget) {
                                    var liParent = ($widget.closest("li").attr("id"));
                                    window.alert(liParent);
                                    var splits = liParent.split("Li");
                                    var countHold = splits[1];
                                    redrawChart(countHold);
                                } 
                            },*/
                            draggable: {
                                handle: '.dragDiv'
                            }
                            
                        }).data('gridster');


                        addNewWidget(count, gridster);
                        count = count + 1;

                        addNewWidget(count, gridster);
                        count = count + 1;

                        addNewWidget(count, gridster);
                        count = count + 1;

                        addNewWidget(count, gridster);
                        count = count + 1;

                        addNewWidget(count, gridster);
                        count = count + 1;

                        addNewWidget(count, gridster);
                        count = count + 1;

                        addNewWidget(count, gridster);
                        count = count + 1;

                        addNewWidget(count, gridster);
                        count = count + 1;

                        addNewWidget(count, gridster);
                        count = count + 1;

                        addNewWidget(count, gridster);
                        count = count + 1;

                        $(document).on("click", ".deleteWidgetDiv", function () {
                            $(this).closest("li").addClass("activ");
                            gridster.remove_widget($('.activ'));
                        });
                        $(window).on('beforeunload', function () {
                            socket.close();
                        });

                        /* Popup Window */
                        
                        function clickInsideElement(e, className) {
                            var el = e.srcElement || e.target;

                            if (el.classList.contains(className)) {
                                return el;
                            } else {
                                while (el = el.parentNode) {
                                    if (el.classList && el.classList.contains(className)) {
                                        return el;
                                    }
                                }
                            }

                            return false;
                        }

                        /* Get's exact position of event */
                        function getPosition(e) {
                            var posx = 0;
                            var posy = 0;

                            if (!e) var e = window.event;

                            if (e.pageX || e.pageY) {
                                posx = e.pageX;
                                posy = e.pageY;
                            } else if (e.clientX || e.clientY) {
                                posx = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
                                posy = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
                            }

                            return {
                                x: posx,
                                y: posy
                            }
                        }
                        /*  Variables */
                        var contextMenuClassName = "context-menu";
                        var contextMenuItemClassName = "context-menu__item";
                        var contextMenuLinkClassName = "context-menu__link";
                        var contextMenuActive = "context-menu--active";

                        var taskItemClassName = "widget";
                        var taskItemInContext;
                        var taskItemInContextAdd;

                        var clickCoords;
                        var clickCoordsX;
                        var clickCoordsY;

                        var menu = document.querySelector("#context-menu");
                        var menuAdd = document.querySelector("#addWidget");
                        var menuItems = menu.querySelectorAll(".context-menu__item");
                        var menuState = 0;
                        var menuStateAdd = 0;
                        var menuWidth;
                        var menuWidthAdd;
                        var menuHeight;
                        var menuHeightAdd;
                        var menuPosition;
                        var menuPositionAdd;
                        var menuPositionX;
                        var menuPositionXAdd;
                        var menuPositionY;
                        var menuPositionYAdd;

                        var windowWidth;
                        var windowWidthAdd;
                        var windowHeight;
                        var windowHeightAdd;

                        var contextHolder = 0; 

                        /*  Initialise our application's code */

                        function initPopUp() {
                            contextListener();
                            clickListener();
                            keyupListener();
                            resizeListener();
                        }

                        /* Listens for contextmenu events */
                        function contextListener(){
                            document.addEventListener("contextmenu", function (e) {
                                taskItemInContextAdd = clickInsideElement(e, "gridster");

                                if (taskItemInContextAdd) {
                                    e.preventDefault();
                                    toggleMenuOnAdd();
                                    positionMenuAdd(e);
                                } else {
                                    taskItemInContextAdd = null;
                                    toggleMenuOffAdd();
                                }
                            });
                            document.addEventListener("contextmenu", function (e) {
                                taskItemInContext = clickInsideElement(e, taskItemClassName);

                                if (taskItemInContext) {
                                    contextHolder = $(e.target).closest("li").attr("id");
                                    e.preventDefault();
                                    toggleMenuOffAdd();
                                    toggleMenuOn();
                                    positionMenu(e);
                                } else {
                                    taskItemInContext = null;
                                    toggleMenuOff();
                                }
                            });
                        }

                        /* Listens for click events */
                        function clickListener() {
                            document.addEventListener("click", function (e) {
                                var clickeElIsLink = clickInsideElement(e, contextMenuLinkClassName);

                                if (clickeElIsLink) {
                                    e.preventDefault();
                                    menuItemListener(clickeElIsLink, contextHolder);
                                } else {
                                    var button = e.which || e.button;
                                    if (button === 1) {
                                        toggleMenuOff();
                                        toggleMenuOffAdd();
                                    }
                                }
                               
                            });
                        }

                        /* Listens for keyup events */
                        function keyupListener() {
                            window.onkeyup = function (e) {
                                if (e.keyCode === 27) {
                                    toggleMenuOff();
                                    toggleMenuOffAdd();
                                }
                            }
                        }

                        /* Window resize event listener */
                        function resizeListener() {
                            window.onresize = function (e) {
                                toggleMenuOff();
                                toggleMenuOffAdd();
                            };
                        }

                        /* Turns the custom context menu on */
                        function toggleMenuOn() {
                            if (menuState !== 1) {
                                menuState = 1;
                                menu.classList.add(contextMenuActive);
                            }
                        }

                        /* Turns the custom context menu off */
                        function toggleMenuOff() {
                            if (menuState !== 0) {
                                menuState = 0;
                                menu.classList.remove(contextMenuActive);
                            }
                        }
                        /* Turns the custom context menu on */
                        function toggleMenuOnAdd() {
                            if (menuStateAdd !== 1) {
                                menuStateAdd = 1;
                                menuAdd.classList.add(contextMenuActive);
                            }
                        }

                        /* Turns the custom context menu off */
                        function toggleMenuOffAdd() {
                            if (menuStateAdd !== 0) {
                                menuStateAdd = 0;
                                menuAdd.classList.remove(contextMenuActive);
                            }
                        }
                        /* Positions the menu properly */
                        function positionMenu(e) {
                            clickCoords = getPosition(e);
                            clickCoordsX = clickCoords.x;
                            clickCoordsY = clickCoords.y;

                            menuWidth = menu.offsetWidth + 4;
                            menuHeight = menu.offsetHeight + 4;

                            windowWidth = window.innerWidth;
                            windowHeight = window.innerHeight;

                            if ((windowWidth - clickCoordsX) < menuWidth) {
                                menu.style.left = windowWidth - menuWidth + "px";
                            } else {
                                menu.style.left = clickCoordsX + "px";
                            }

                            if ((windowHeight - clickCoordsY) < menuHeight) {
                                menu.style.top = windowHeight - menuHeight + "px";
                            } else {
                                menu.style.top = clickCoordsY + "px";
                            }
                        }
                        function positionMenuAdd(e) {
                            clickCoordsAdd = getPosition(e);
                            clickCoordsXAdd = clickCoordsAdd.x;
                            clickCoordsYAdd = clickCoordsAdd.y;

                            menuWidthAdd = menuAdd.offsetWidth + 4;
                            menuHeightAdd = menuAdd.offsetHeight + 4;

                            windowWidthAdd = window.innerWidth;
                            windowHeightAdd = window.innerHeight;

                            if ((windowWidthAdd - clickCoordsXAdd) < menuWidthAdd) {
                                menuAdd.style.left = windowWidthAdd - menuWidthAdd + "px";
                            } else {
                                menuAdd.style.left = clickCoordsXAdd + "px";
                            }

                            if ((windowHeightAdd - clickCoordsYAdd) < menuHeightAdd) {
                                menuAdd.style.top = windowHeightAdd - menuHeightAdd + "px";
                            } else {
                                menuAdd.style.top = clickCoordsYAdd + "px";
                            }
                        }
                        /* Dummy action function that logs an action when a menu item link is clicked */
                        function menuItemListener(link, liParent) {

                            if (link.getAttribute("data-action").toString() == "Add") {
                                addNewWidget(count, gridster);
                                count++;
                            }else if (link.getAttribute("data-action").toString() == "Delete") {
                                document.getElementById(liParent).className = "activ";
                                gridster.remove_widget($('.activ'));
                            }else{
                                var splits = liParent.split("Li");
                                var countHold = splits[1];
                                editWidget(countHold);
                            }
                            
                            toggleMenuOff();
                            toggleMenuOffAdd();
                        }
                    });
                </script>
               <nav id="context-menu" class="context-menu">
                    <ul class="context-menu__items">
                        <li class="context-menu__item">
                            <a href="#" class="context-menu__link" data-action="Edit"><i class="edit-Widget"></i> Edit Widget</a>
                        </li>
                        <li class="context-menu__item">
                            <a href="#" class="context-menu__link" data-action="Delete"><i class="delete-Widget"></i> Delete Wiget</a>
                        </li>
                    </ul>
                </nav>
               <nav id="addWidget" class="context-menu">
                    <ul class="context-menu__items">
                        <li class="context-menu__item">
                            <a href="#" class="context-menu__link" data-action="Add"><i class="add-Widget"></i> Add Widget</a>
                        </li>
                    </ul>
                </nav>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <br />
                <br />
               <table align="left" border="0">
                <tr>
                    <td>
                        <asp:Button Text="Aquaponics" BorderStyle="None" ID="Aquaponics" CssClass="Initial_DataSub_aqua" runat="server" OnClick="aqua_Click" />
                        <asp:Button Text="Vermiculture" BorderStyle="None" ID="Vermiculture" CssClass="Initial_DataSub_vermi" runat="server" OnClick="vermi_Click" />
                        <asp:Button Text="Compost" BorderStyle="None" ID="Compost" CssClass="Initial_DataSub_comp" runat="server" OnClick="comp_Click" />
                        <asp:Button Text="Energy" BorderStyle="None" ID="Energy" CssClass="Initial_DataSub_energy" runat="server" OnClick="energy_Click" />
                        <asp:Button Text="Biodiesel" BorderStyle="None" ID="Biodiesel" CssClass="Initial_DataSub_bio" runat="server" OnClick="bio_Click" />
                    </td>
                </tr>
                </table>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <br />
                <br />
                <br />
               <table align="left" border="0">
                <tr>
                    <td>
                        <asp:Button Text="Add User" BorderStyle="None" ID="add_user" CssClass="Initial_adduser" runat="server" OnClick="adduser_Click" />
                        <asp:Button Text="Delete User" BorderStyle="None" ID="delete_user" CssClass="Initial_deleteuser" runat="server" OnClick="deleteuser_Click" />
                        <asp:Button Text="Manage User" BorderStyle="None" ID="manage_user" CssClass="Initial_manageuser" runat="server" OnClick="manageuser_Click" />
                    </td>
                </tr>
                </table>
            </asp:View>
        </asp:MultiView>

     </form>
    </body>
</html>
