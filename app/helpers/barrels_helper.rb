module BarrelsHelper
  #   def link_to_add_wine_sort(form, barrel)
  #   # Создаём новый объект. Аналог build в ранних примерах
  #   new_obj = WineSort.new()
  #   # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
  #   # Все role_users в форме имеют свой номер
  #   # Мы его пока заменям на фразу new_ru
  #   fld = form.fields_for(:wine_sort, new_obj,
  #     :child_index => 'new_wine_sort') do |pf|
  #     render('barrels/wine_sort_barrel_form', pf: pf, i: 'Новый')
  #   end
  #   # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
  #   link_to(?#, class: 'btn btn-info',
  #       id: 'add_wine_sort_link', data: {content: "#{fld}"}) do
  #     fa_icon("plus") + " Новое вино"
  #   end
  # end
  # def link_to_remove_wine_sort(form)
  #   # При удалении nested-конструкции. Она реально не удаляется
  #   # Соответствующий html-блок скрывается
  #   # При этом выставляется значение специального поля _destroy
  #   # По этому поля rails понимает, что связь надо удалить
  #   form.hidden_field(:_destroy, class: 'remove_fields') +
  #       # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
  #       link_to(?#, class: 'remove_fields remove_wine_sort') do
  #     fa_icon('times', title: 'Удалить сорт вина') + ' Удалить'
  #   end
  # end
end
