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
//= require turbolinks
//= require_tree .

function TimeInputChange() {
  var value = '';
  var time = document.getElementById('time').value.replace(':', '');

  if (time.length >= 4) {
    value = time.substring(0, 2) + ':' + time.substring(2, 4);
  } else if (time.length == 3) {
    value = time.substring(0, 1) + ':' + time.substring(1, 3)
  } else {
    value = time;
  }

  document.getElementById('time').value = value;
}
