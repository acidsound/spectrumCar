var s=function(d) {
  var r = new XMLHttpRequest();
  r.open("GET", "/"+d, true);
  r.onreadystatechange = function () {
  };
  r.send();
};
var dq=function(s,ev,c) { return document.querySelector(s).addEventListener(ev, c); };
window.addEventListener('DOMContentLoaded', function() {
  console.log("ready");
  dq("#fwd>.left", 'touchstart', function(e) { s("97"); });
  dq("#fwd>.middle", 'touchstart', function(e) { s("99"); });
  dq("#fwd>.right", 'touchstart', function(e) { s("79"); });
  dq("#mid>.left", 'touchstart', function(e) { s("95"); });
  dq("#mid>.middle", 'touchstart', function(e) { s("55"); });
  dq("#mid>.right", 'touchstart', function(e) { s("59"); });
  dq("#bwd>.left", 'touchstart', function(e) { s("02"); });
  dq("#bwd>.middle", 'touchstart', function(e) { s("00"); });
  dq("#bwd>.right", 'touchstart', function(e) { s("20"); });
  var out=document.querySelectorAll("#panel>div>div");
  for (var k in out) {
    (function(qq, oq) {
      if (typeof oq[qq]=="object") {
        oq[qq].addEventListener('touchend', function(e) {
          s("55");
        });
      }
    })(k, out);
  }
});