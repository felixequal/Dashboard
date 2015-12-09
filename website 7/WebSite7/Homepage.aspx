<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Homepage" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <title>STORC Dashboard</title>
        <link rel="stylesheet" type="text/css" href="../Style/gridster.css"/>
        <link rel="stylesheet" type="text/css" href="../Style/Tabs.css" />
        <link rel="stylesheet" type="text/css" href="../Style/colors.css" />
        <link rel="stylesheet" type="text/css" href="../Style/PopUpMenu.css" />
        <script type="text/javascript" src="../Scripts/jquery-2.1.4.js"></script>
        <script src="../Scripts/gridster.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="../Scripts/Chart.js"></script>
        <script type="text/javascript" src="../Scripts/jquery-ui-1.11.4.js"></script>
        <script type="text/javascript" src="../Scripts/CreateNewChart.js"></script>
        <script type="text/javascript" src="../Scripts/CreateNewWidget.js"></script>
    </head>
    <style type="text/css">
        .deleteWidgetDiv {
            background: #999999;
            float: right;
            font-size: 12px;
            padding: 4px 4px 0px ;
            cursor: pointer;
        }
        .widget, header, .dragDiv  {
            background: #aaaaaa;
            font-size: 12px;
            display: block;
            padding: 4px 0 0px ;
            cursor: move;
        }
        .gridster{
            background-color: rgba(128, 128, 128, 0.3);
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
                    <p>Add new widget:</p>
                    <button id="addWidgetButton">Add widget</button>
                </div>
                <div class="gridster">
                    <ul style="width: 1100px; position: relative; height: 390px;">
                    </ul>
                </div>
                <script>
                    var count = 0;
                    var gridster;

                    $(function () {
                        initPopUp();

                        gridster = $(".gridster > ul").gridster({
                            widget_base_dimensions: [140, 140],
                            widget_margins: [10, 10],
                            helper: 'clone',
                            avoid_overlapped_widgets: true,
                            draggable: {
                                handle: '.dragDiv'
                            }
                        }).data('gridster');

                        $(document).on("click", "#addWidgetButton", function (e) {
                            e.preventDefault();
                            addNewWidget(count,gridster);
                            count = count + 1;
                        });
                        $(document).on("click", ".deleteWidgetDiv", function () {
                            $(this).closest("li").addClass("activ");
                            gridster.remove_widget($('.activ'));
                        });
                        $(window).on('beforeunload', function () {
                            socket.close();
                        });
                        // Popup Window
                        
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

                        /**
                         * Get's exact position of event.
                         * 
                         * @param {Object} e The event passed in
                         * @return {Object} Returns the x and y position
                         */
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

                        var taskItemClassName = "menu-holder";
                        var taskItemInContext;

                        var clickCoords;
                        var clickCoordsX;
                        var clickCoordsY;

                        var menu = document.querySelector("#context-menu");
                        var menuItems = menu.querySelectorAll(".context-menu__item");
                        var menuState = 0;
                        var menuWidth;
                        var menuHeight;
                        var menuPosition;
                        var menuPositionX;
                        var menuPositionY;

                        var windowWidth;
                        var windowHeight;

                        var contextHolder; 

                        /*  Initialise our application's code */

                        function initPopUp() {
                            contextListener();
                            clickListener();
                            keyupListener();
                            resizeListener();
                        }

                        /**
                         * Listens for contextmenu events.
                         */
                        function contextListener() {
                            document.addEventListener("contextmenu", function (e) {
                                taskItemInContext = clickInsideElement(e, taskItemClassName);

                                if (taskItemInContext) {
                                    contextHolder = $(e.target).closest("li").attr("id");
                                    e.preventDefault();
                                    toggleMenuOn();
                                    positionMenu(e);
                                } else {
                                    taskItemInContext = null;
                                    toggleMenuOff();
                                }
                            });
                        }

                        /**
                         * Listens for click events.
                         */
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
                                    }
                                }
                               
                            });
                        }

                        /**
                         * Listens for keyup events.
                         */
                        function keyupListener() {
                            window.onkeyup = function (e) {
                                if (e.keyCode === 27) {
                                    toggleMenuOff();
                                }
                            }
                        }

                        /**
                         * Window resize event listener
                         */
                        function resizeListener() {
                            window.onresize = function (e) {
                                toggleMenuOff();
                            };
                        }

                        /**
                         * Turns the custom context menu on.
                         */
                        function toggleMenuOn() {
                            if (menuState !== 1) {
                                menuState = 1;
                                menu.classList.add(contextMenuActive);
                            }
                            //window.alert("On");
                        }

                        /**
                         * Turns the custom context menu off.
                         */
                        function toggleMenuOff() {
                            if (menuState !== 0) {
                                menuState = 0;
                                menu.classList.remove(contextMenuActive);
                            }
                        }

                        /**
                         * Positions the menu properly.
                         * 
                         * @param {Object} e The event
                         */
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

                        /**
                         * Dummy action function that logs an action when a menu item link is clicked
                         * 
                         * @param {HTMLElement} link The link that was clicked
                         */
                        function menuItemListener(link, liParent) {
                            var splits = liParent.split("Li");
                            var count = splits[1];
                            if (link.getAttribute("data-action").toString() == "Delete") {
                                document.getElementById(liParent).className = "activ";
                                gridster.remove_widget($('.activ'));
                            }
                            // gridster.remove_widget($('.activ'));
                            
                            toggleMenuOff();
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
