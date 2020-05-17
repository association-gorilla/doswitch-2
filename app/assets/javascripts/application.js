// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree .

function set2fig(num) {
  // 桁数が1桁だったら先頭に0を加えて2桁に調整する
  var ret;
  if (num < 10) {
    ret = "0" + num;
  } else {
    ret = num;
  }
  return ret;
}

function showClock2() {
  var nowTime = new Date();
  var nowHour = set2fig(nowTime.getHours());
  var nowMin = set2fig(nowTime.getMinutes());
  var nowSec = set2fig(nowTime.getSeconds());
  var msg = "現在時刻は、" + nowHour + ":" + nowMin + ":" + nowSec + " です。";
  document.getElementById("RealtimeClockArea2").innerHTML = msg;
}
setInterval("showClock2()", 1000);