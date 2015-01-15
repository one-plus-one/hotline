/**
 * Created by twer on 15/1/15.
 */
function keystoke(obj) {
    var e = window.event;
    var id = document.activeElement.id;
    var points = id.split(":");
    switch (e.keyCode) {
        case 37:
            get_focus(-1, 0);
            break;
        case 38:
            get_focus(0, -1);
            break;
        case 39:
            get_focus(1, 0);
            break;
        case 40:
            get_focus(0, 1);
            break;
    }
    function get_focus(x, y) {
        var px = parseInt(points[0]) + x;
        var py = parseInt(points[1]) + y;
        document.getElementById(px + ":" + py).focus();
    }
}
