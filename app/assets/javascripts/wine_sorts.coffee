# save_form = ->
#   if ($('#wine_sort_relationships_attributes_0_grape_sort_id').val()   == '*Создание нового')
#     $('#wine_sort_relationships_attributes_0_grape_sort_id').remove()
#     $("#wine_sort_relationships_attributes_0_grape_sort_attributes_id").remove()
#   else if ($('#wine_sort_relationships_attributes_0_grape_sort_id').val() == '*Редактирование')
#     $('#wine_sort_relationships_attributes_0_grape_sort_id').remove()
#
# insert_form = ->
#   # f = $("#gsid").attr("data-content")
#   if ($('#gsid').val() == '')
#     $("#grape_sort-fields").html("Выбран существующий сорт виногрда")
#
# ready = ->
#   insert_form()
#   $("gsid").change -> insert_form()
#   # $('#save').on 'click', save_form
#
# $(document).ready ready
# $(document).on 'page:load', ready
