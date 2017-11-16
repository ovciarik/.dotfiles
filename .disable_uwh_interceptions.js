// ==UserScript==
// @name           Disable ^U, ^W, ^H interceptions
//
// @run-at         document-start
// @include        *
// @grant          none
// ==/UserScript==

// ^U, ^W, ^H
keycodes = [85, 87, 72];  

(window.opera ? document.body : document).addEventListener('keydown', function(e) {
    // alert(e.keyCode ); //uncomment to find more keyCodes
    if (keycodes.indexOf(e.keyCode) != -1 && e.ctrlKey) {
        e.cancelBubble = true;
        e.stopImmediatePropagation();
    // alert("Gotcha!"); //ucomment to check if it's seeing the combo
    }
    return false;
}, !window.opera);
