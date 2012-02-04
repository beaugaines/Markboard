# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  input_title = $('#page_title')
  input_title.val('Give the page a title') if input_title.val().length == 0
  input_title.focus()
  input_title.select()