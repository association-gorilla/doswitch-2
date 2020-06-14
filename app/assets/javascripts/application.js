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
//= require chartkick
//= require Chart.bundle
//= require rails-ujs
//= require activestorage
//= require jquery
//= require moment
//= require moment/ja.js
//= require fullcalendar
//= require fullcalendar/lang/ja
//= require jquery_ujs
//= require_tree .
//= require toastr

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

var fix_nowTime = new Date();
var fix_nowHour = fix_nowTime.getHours();
var fix_nowMin = fix_nowTime.getMinutes();
var fix_nowSec = fix_nowTime.getSeconds();

function set1hour(num) {
  // 実行時間の時だけ抜き出すと何時間か算出する
  if (num > 3600) {
    num /= 3600;
  } else {
    num = 0;
  }
  num = num | 0
  return num;
}

function set1min(num) {
  // 実行時間の分だけ抜き出すと何分か算出する
  if (num >= 3600) {
    num = num % 3600 / 60;
  } else if (num >= 60) {
    num /= 60;
  } else {
    num = 0
  }
  num = num | 0
  return num;
}

function set1sec(num) {
  // 実行時間の秒だけ抜き出すと何秒か算出する
  if (num >= 3600) {
    num = num % 3600 % 60;
  } else if (num >= 60) {
    num %= 60;
  }
  num = num | 0
  return num;
}

function limit59set(num) {
  // 分もしくは秒が59以上にならないようにする
  if (num > 59) {
    num %= 60
  } else if (num < 0) {
    num += 60
  }
  num = num | 0
  return num
}

function waste1set(num) {
  // 分もしくは秒が59以上になる場合に超えた分を返す
  if (num > 59) {
    num /= 60
  } else if (num < 0) {
    num = -1
  } else {
    num = 0
  }
  num = num | 0
  return num
}

// 実行中の時間を出力
$(document).ready(function () {
  setInterval(function () {
    var recordTime = Number($('#record-time').val());
    // 時・分・秒に切り分けて算出
    var recordTimeHour = set1hour(recordTime);
    var recordTimeMin = set1min(recordTime);
    var recordTimeSec = set1sec(recordTime);
    // 各切り分けた時間を現在時刻の固定値から差し引き合計値を求める
    var totalAddHour = fix_nowHour - recordTimeHour;
    var totalAddMin = fix_nowMin - recordTimeMin;
    var totalAddSec = fix_nowSec - recordTimeSec;
    var nowTime = new Date();
    // 表示限界を超えないように調整
    var just_nowMin = limit59set(nowTime.getMinutes() - totalAddMin);
    var just_nowSec = limit59set(nowTime.getSeconds() - totalAddSec);
    // 超えた分を後に足すために定義する
    var addBeyondHour = waste1set(nowTime.getMinutes() - totalAddMin);
    var addBeyondMin = waste1set(nowTime.getSeconds() - totalAddSec);
    // 時と分には超えたぶんを足す
    var nowHour = set2fig(nowTime.getHours() - totalAddHour + addBeyondHour);
    var nowMin = set2fig(just_nowMin + addBeyondMin);
    var nowSec = set2fig(just_nowSec);
    var msg =  nowHour + ":" + nowMin + ":" + nowSec;
    $("#record_time_output").text(msg);
  }, 1000);
});

// カレンダー表示
$(function () {
  // 画面遷移を検知
  // $(document).on('turbolinks:load', function () {
  //     if ($('#calendar').length) {

  function Calendar() {
    return $('#calendar').fullCalendar({});
  }

  function clearCalendar() {
    $('#calendar').html('');
  }

  //events: '/events.json', 以下に追加
  $('#calendar').fullCalendar({
    events: '/users/:user_id/plan_allots.json',
    //カレンダー上部を年月で表示させる
    titleFormat: 'YYYY年 M月',
    //曜日を日本語表示
    dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
    //ボタンのレイアウト
    header: {
      left: '',
      center: 'title',
      right: 'today prev,next'
    },
    //終了時刻がないイベントの表示間隔
    defaultTimedEventDuration: '24:00:00',
    buttonText: {
      prev: '前月',
      next: '次月',
      prevYear: '前年',
      nextYear: '翌年',
      today: '今日',
      month: '月',
      week: '週',
      day: '日'
    },
    // Drag & Drop & Resize
    editable: false,
    //イベントの色を変える
    eventColor: '#34cefa',
    //イベントの文字色を変える
    eventTextColor: '#000000',
    eventRender: function (event, element) {
      element.css("font-size", "0.8em");
      element.css("padding", "5px");
    }

  });
});


toastr.options = {
  "closeButton": false,
  "debug": false,
  "newestOnTop": false,
  "progressBar": false,
  "positionClass": "toast-top-left",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut",
  "textColor" : "#fff"

    

}