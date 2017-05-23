module WineSortsHelper
  # def link_to_add_relationship(form, wine_sort)
  #   # Создаём новый объект. Аналог build в ранних примерах
  #   new_obj = Relationship.new()
  #   # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
  #   # Все role_users в форме имеют свой номер
  #   # Мы его пока заменям на фразу new_ru
  #   fld = form.fields_for(:relationship, new_obj,
  #     :child_index => 'new_relationship') do |pf|
  #     render('wine_sorts/relationships_wine_sort_form', pf: pf, i: 'Новое')
  #   end
  #   # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
  #   link_to(?#, class: 'btn btn-info',
  #       id: 'add_relationship_link', data: {content: "#{fld}"}) do
  #     fa_icon("plus") + " Новое соотношение"
  #   end
  # end
  # def link_to_remove_relationship(form)
  #   # При удалении nested-конструкции. Она реально не удаляется
  #   # Соответствующий html-блок скрывается
  #   # При этом выставляется значение специального поля _destroy
  #   # По этому поля rails понимает, что связь надо удалить
  #   form.hidden_field(:_destroy, class: 'remove_fields') +
  #       # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
  #       link_to(?#, class: 'remove_fields remove_relationship') do
  #     fa_icon('times', title: 'Удалить сорт вина') + ' Удалить'
  #   end
  # end
  # def wine_sort_options()
  #   WineSort.all.pluck('name,type_of_wine,color, id')
  # end
end
