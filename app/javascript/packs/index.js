import { isEmpty } from "@rails/webpacker/package/utils/helpers";
import selectize from "@selectize/selectize";
$(function(){
    jQuery("select").selectize();
});

var min = document.getElementById("min");
var max = document.getElementById("max");
var regNum = /[0-9]/;

document.addEventListener('DOMContentLoaded', () => {
    (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
      const $notification = $delete.parentNode;
  
      $delete.addEventListener('click', () => {
        $notification.parentNode.removeChild($notification);
      });
    });
});

$("#min").keyup(function(){
    if (regNum.exec(min.value)) {
        if (max.value) {
            if (min.value > max.value) {
                alert("minimum value should not greater than maximum value!");
            } 
        }
    }
});