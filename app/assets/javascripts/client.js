var ip = "localhost";
var ws = new WebSocket('ws://' + ip + ':4000');




function appendToChat(msg) {
  var messages = document.querySelector('.messages');
  var msgli = document.createElement('li');
  var txtNode = document.createTextNode(msg);
  msgli.appendChild(txtNode);
  messages.appendChild(msgli);
  messages.scrollTop = messages.scrollHeight;
}

window.onkeypress = function(evt) {
  var messages = document.querySelector('.messages');
  var inputMessage = document.querySelector('.inputMessage');
  inputMessage.focus();
  if (evt.keyCode === 13) {
    var inputMessage = document.querySelector('.inputMessage');
    // var div1 = document.createElement("div");
    // div1.setAttribute("id", "div1");
    // body.appendChild(div1);
    var url = "http://localhost:3000/users/3.json";
    var xhr = new XMLHttpRequest();
    xhr.open("GET", url);
    xhr.addEventListener('load', function(e) {
    var data = xhr.responseText;
    console.log(data);
    var parsed = JSON.parse(data);
    var username = document.createElement("h1")
    var userParse = parsed["username"];
    username.innerHTML = userParse; 
    console.log(userParse)

    // messages.appendChild(userParse);
    // inputMessage.appendChild(userParse);
  });
  xhr.send();
    //appendToChat(userParse.value);
    appendToChat(inputMessage.value);
    ws.send(inputMessage.value);
    inputMessage.value = "";

  }
}

ws.onmessage = function(evt) {
  var message = evt.data;



  // var signedMessage = parsed["username"] + ": " + message;
  appendToChat(message);
}