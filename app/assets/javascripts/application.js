// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(event){
  $('#login-button').on('click', login_show);
  $('#create-account-button').on('click', create_account_show);
  $('.create-survey').on('submit', surveyCreationEvent);
  $('#new_question').on('submit', questionCreationEvent);
  $('.create-options').on('submit', questionCreationEvent);
});

var surveyCreationEvent = (function(event) {
  event.preventDefault();
  // var test = $(event.target)
  $.ajax({
    url: '/surveys',
    method: 'POST',
    data: $('form').serialize()
   }).done(function(response) {
      $.ajax({
        url: '/surveys/' + response.id + '/questions/new',
        method: 'GET'
      }).done(function(response){
        event.preventDefault();
        $('.create-questions').append(response);
        $('.create-questions').show();
        $('.create-survey').hide();
      }).fail(function(error){
        console.log(error)
      })
    }).fail(function(error) {
      console.log("chicken");
    })
});

var questionCreationEvent = (function(event) {
  event.preventDefault();
  var surveyId = $('input:hidden[name=survey_id]').val()
  $.ajax({
        url: '/surveys/' + surveyId + '/answers/new',
        method: 'GET'
      }).done(function(response){
        // event.preventDefault();
        $('.innerfirst').replaceWith(response);
        $('.create-options').show();
        $('.create-questions').hide();
      }).fail(function(error){
        console.log(error)
      })
});

var login_show = (function(){
  $('#login-form').toggle();
});

var create_account_show = (function() {
  $("#create-account-form").toggle();
});

