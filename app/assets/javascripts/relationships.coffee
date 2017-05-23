# nested_start
# Удаление одной роли
@delete_one_wg = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
# Включаем все кнопки удаления
@del_all_wgs = ->
  $('a.remove_grape_sort').on 'click', ->
    window.delete_one_wg($(this))
    false
  false
# Включаем кнопку добавления роли
@add_new_wg = ->
  $('#add_grape_sort_link').on 'click', ->
    # Подменяем временный id с фразой new_ru на случайной число
    new_id = new Date().getTime()
    regexp = new RegExp("new_grape_sort", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    # Вставляем на страницу
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    # Если бы были даты с datepicker-ом
    # window.datepicker_activation_by_item(panel)
    # Включаем у новой роли кнопку удаления
    # Её раньше не было, поэтому при зарузке страницы она не включалась
    panel.find('a.remove_grape_sort').on 'click', ->
      window.delete_one_wg($(this))
      false
    false
# Запуск всего вышеописанного
wg_ready = ->
  window.add_new_wg()
  window.del_all_wgs()
$(document).on 'page:load', wg_ready # Включаем при ajax обновлении страницы
$(document).ready wg_ready # Включаем при обычном обновлении страницы
# nested_finish
