const char HTML_RAW[] PROGMEM = R"rawliteral(
HTTP/1.1 200 OK
Content-type:text/html

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <!--<meta http-equiv="refresh" content="30">-->
  <title>Smart Grid Control Panel</title>
</head>
<style>
  * {
  margin:0;
  padding:0;
  font-family: Arial, Helvetica, sans-serif;
  color: white;
}

body {
  background-color: #101112;
}

#main_title {
  text-align: center;
  margin-top: 50px;
  font-size: 30px;
}

#panel {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  text-align: center;
}

.panel_box {
  min-width: 300px;
  height: 250px;
  background-color: #272727;
  margin: 1%;
  border: 1px solid white;
  border-radius: 10px;
}

.panel_box > * {
  margin: 10px;
}

.panel_box_title {
  font-size: 35px;
  color:#b2b2b2
}

.sensor_state {
  color:green;
}

/* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

/* Hide default HTML checkbox */
.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>
<body>
  <p id="main_title">Smart Grid Control Panel</p>
  <div id="panel">

    <div class="panel_box" id="led">
      <p class="panel_box_title">LED Control</p>
      <p class="panel_box_sensor sensor_state" id="led_state"></p>
      <label class="switch">
        <input id="led_switch" type="checkbox">
        <span class="slider round"></span>
      </label>
    </div>
    <p id="RESPONSE"></p>

  </div>
  <script type="module">
    //var led_state_var = document.getElementById('led_switch').checked;
    var xhttp = new XMLHttpRequest();
    if (document.getElementById('led_switch').checked == true) {
      xhttp.open("GET", "/H", true);
    } else {
      xhttp.open("GET", "/L", true);
    }
    xhttp.send();
    
  </script>
</body>
</html>
)rawliteral";
