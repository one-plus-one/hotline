function ws_connect() {
    var btnParking = document.getElementById("btnParking");
    var btnWaiting = document.getElementById("btnWaiting");
    var btnOnhook = document.getElementById("btnOnhook");
    var btnOffhook = document.getElementById("btnOffhook");

    if ("WebSocket" in window) {
        ws = new WebSocket("ws://localhost:8080/echo");
        ws.onopen = function (event) {

        };

        ws.onerror = function (event) {
            log.innerHTML +=
                "<div class='red'>error on websocket!</div>";
        };

        ws.onmessage = function (event) {
            var data = event.data.split(",");
            var ani = data[6].split(":")[1];
            var status = data[3].split(":")[1];
            if (status == 'ringing') {
                location.href = 'oncall/' + ani;
            }
            else if (status == 'parking'){
                btnParking.disabled = true;   //不能编辑
                btnWaiting.disabled = false;
            }
            else if (status == 'waiting'){
                btnWaiting.disabled = true;
                btnParking.disabled = false;
            }
            else if (status == 'offhook'){
                btnWaiting.disabled = true;
                btnParking.disabled = true;
            }
        };
        ws.onclose = function (event) {
        };
    } else {
        // the browser doesn't support WebSocket
        alert("WebSocket NOT supported here!\r\n\r\nBrowser: " +
        navigator.appName + " " + navigator.appVersion);
    }
    return false;
};

function ws_disconnect() {
    ws.close();

    return false;
}

function ws_send_data() {
    ws.send(val.value);
    return false;
}

function login() {
    location.href = "wisexclient:login?agentid=1109&passwd=Hanwin@20!4&name=Johnson";
}
function dial() {
    location.href = "wisexclient:dial?ani=31119104&dnis=718930430189";
}

function onhook() {
    location.href = "wisexclient:onhook";
}

var answer = function (tel) {
    location.href = "/answer/" + tel;
}

var offhook = function() {
    location.href = "wisexclient:offhook"
};

function setbusy() {
    location.href = "wisexclient:park";
    btnParking.disabled=true;
    btnWaiting.disabled=false;
}

function setready() {
    location.href = "wisexclient:setready";
    btnParking.disabled=false;
    btnWaiting.disabled=true;
}

function hold() {
    location.href = "wisexclient:hold";
}

function unhold() {
    location.href = "wisexclient:unhold";
}

function blindtransfer() {
    location.href = "wisexclient:blindtransfer?transferee=1000";
}

function dialthird() {
    location.href = "wisexclient:dial?ani=31119105&dnis=718901700171";
}

function alternate() {
    location.href = "wisexclient:alternate";
}

function hungupthird() {
    location.href = "wisexclient:hungupthird";
}

function transfer() {
    location.href = "wisexclient:transfer";
}

function startconference() {
    location.href = "wisexclient:startconference?ani=31119127&third_party=718901700171";
}

function logout() {
    location.href = "wisexclient:logout";
}

function getagentstatus() {
    location.href = "wisexclient:getagentstatus";
}
