save_form = ->
  $('.select_form').each ->
    if ($('select', this).val() == '*Создание нового')
      $('select', this).remove()
      $('select', this).next().remove()
    else if ($('select', this).val() == '*Редактирование')
      $('select', this).remove()
    else
      $('select', this).next().remove()

insert_form = ->
  $('.select_form').each ->
    f = $(".grape_sort-fieldset", this).attr("data-content")
    $('select', this).change -> insert_form()
    if ($('select', this).val() == '*Создание нового')
      $('.grape_sort-fields', this).html(f)
      $('.grape_sort-fields input', this).val('')
      datepicker_activation()
    else if ($('select', this).val() == '*Редактирование')
      $('.grape_sort-fields', this).html(f)
      datepicker_activation()
    else
      $('.grape_sort-fields', this).html("Выбран существующий сорт винограда")

ready = ->
  insert_form()
  $("#add_grape_sort_link").click -> insert_form()
  $('#save').on 'click', save_form


$(document).ready ready
$(document).on 'page:load', ready
