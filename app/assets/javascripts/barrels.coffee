# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/
save_form = ->
  if ($('#barrel_wine_sort_id').val()   == '*Создание нового')
    $('#barrel_wine_sort_id').remove()
    $("#barrel_wine_sort_attributes_id").remove()
  else if ($('#barrel_wine_sort_id').val() == '*Редактирование')
    $('#barrel_wine_sort_id').remove()

insert_form = ->
  f = $("#wine_sort-fieldset").attr("data-content")
  if ($('#barrel_wine_sort_id').val() == '*Создание нового')
    $("#wine_sort-fields").html(f)
    $("#barrel_wine_sort_attributes_name").val('')
    $("#barrel_wine_sort_attributes_type_of_wine").val('')
    $("#barrel_wine_sort_attributes_color").val('')
    $("#barrel_wine_sort_attributes_barrel_extract").val('')
    $("#barrel_wine_sort_attributes_bottle_extract").val('')
  else if ($('#barrel_wine_sort_id').val() == '*Редактирование')
    $("#wine_sort-fields").html(f)
  else
    $("#wine_sort-fields").html("Выбрана существующая бочка")

ready = ->
  insert_form()
  $("#barrel_wine_sort_id").change -> insert_form()
  $('#save').on 'click', save_form

$(document).ready ready
$(document).on 'page:load', ready
