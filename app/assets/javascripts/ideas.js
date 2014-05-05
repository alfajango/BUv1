// THIS IS NOT BEING ACCESSED ???

//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

// from http://stackoverflow.com/questions/15247184/angularjs-equivalent-to-jquery-toggle-show-hide-a-section

// 'use strict';
// var App=angular.module('myApp',[]);
// function Ctrl($scope){
// }


// function ShowDiv() {
//     document.getElementById("replyBox").style.display = "block";
// }

// Wait for the page to load first
window.onload = function ShowDiv() {
  document.getElementById("replyBox").style.display = "block";

  return false;
}