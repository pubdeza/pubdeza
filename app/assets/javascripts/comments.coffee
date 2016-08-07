# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".form-edit-toggle").click ->
    $(this).siblings(".comment-edit-form").slideToggle()
    $(this).parent().siblings(".comment-contents").toggleClass("display-none")
