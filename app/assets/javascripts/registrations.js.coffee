# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#available_shifts a.add_fields").data("association-insertion-method", "append").data("association-insertion-node", "#available_shift_fields")

  $('.form-datetime').datetimepicker
    autoclose: 1
    todayHighlight: 0
    startDate: '2014-04-23T19:00:00Z'
    endDate: '2014-04-26-T16:00:00Z'
  
  $('#available_shift_fields').on 'cocoon:after-insert', (e, element) ->
    $(element).find(".form-datetime").datetimepicker
      autoclose: 1
      todayHighlight: 0
      startDate: '2014-04-23T19:00:00Z'
      endDate: '2014-04-26-T16:00:00Z'

