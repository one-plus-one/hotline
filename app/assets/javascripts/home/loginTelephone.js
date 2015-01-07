$('#main').ready(function() {
	    var log = $('log');
        console.log('ready function');
	    ws_connect();
        login();
}
	
);

function ws_connect(){
	if ("WebSocket" in window) {
				var ws = new WebSocket("ws://localhost:8080/echo");
				ws.onopen = function(event) {
					log.innerHTML+=
						"<div class='green'>websocket connected</div>";
					//connect.style.display = 'none';
					//tools.style.display = 'block';
				};

				ws.onerror = function(event) {
					log.innerHTML+=
						"<div class='red'>error on websocket!</div>";
				};

				ws.onmessage = function(event) {
					log.innerHTML+=
						"<div>get message:<span class='data'>"+event.data+"</span></div>";
				};

				ws.onclose = function(event) {
					log.innerHTML+=
						"<div class='red'>websocket closed</div>";
					//connect.style.display = 'block';
					tools.style.display = 'none';
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
    log.innerHTML+=
        "<div>send message:<span class='data'>"+val.value+"</span></div>";
    ws.send(val.value);

    return false;
}

function login(){
    location.href="wisexclient:login?agentid=1109&passwd=Hanwin@20!4&name=Johnson";
}
function dial(){
    location.href="wisexclient:dial?ani=31119104&dnis=718930430189";
}

function offhook(){
    location.href="wisexclient:offhook";
}

function onhook(){
    location.href="wisexclient:onhook";
}

function  setbusy(){
    location.href="wisexclient:park";
}

function  setready(){
    location.href="wisexclient:setready";
}

function hold(){
    location.href="wisexclient:hold";
}

function unhold(){
    location.href="wisexclient:unhold";
}

function blindtransfer(){
    location.href="wisexclient:blindtransfer?transferee=1000";
}

function dialthird(){
    location.href="wisexclient:dial?ani=31119105&dnis=718901700171";
}

function alternate(){
    location.href="wisexclient:alternate";
}

function hungupthird(){
    location.href="wisexclient:hungupthird";
}

function  transfer(){
    location.href="wisexclient:transfer";
}

function  startconference(){
    location.href="wisexclient:startconference?ani=31119127&third_party=718901700171";
}

function logout(){
    location.href="wisexclient:logout";
}

function getagentstatus(){
    location.href="wisexclient:getagentstatus";
}