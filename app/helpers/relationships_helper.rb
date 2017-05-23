module RelationshipsHelper
  # nested_start
  def link_to_add_grape_sort(form, wine_sort)
    # Создаём новый объект. Аналог build в ранних примерах
    new_object = Relationship.new()
    # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
    # Все role_users в форме имеют свой номер
    # Мы его пока заменям на фразу new_ru
    fields = form.fields_for(:relationships, new_object,
      :child_index => 'new_grape_sort') do |pf|
      render('wine_sorts/relationships_wine_sort_form', pf: pf, i: 'Новый')
    end
    # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
    link_to(?#, class: 'btn btn-info',
        id: 'add_grape_sort_link', data: {content: "#{fields}"}) do
      fa_icon("plus") + " Новый сорт"
    end
  end

  def link_to_remove_grape_sort(form)
    # При удалении nested-конструкции. Она реально не удаляется
    # Соответствующий html-блок скрывается
    # При этом выставляется значение специального поля _destroy
    # По этому поля rails понимает, что связь надо удалить
    form.hidden_field(:_destroy, class: 'remove_fields') +
        # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
        link_to(?#, class: 'remove_fields remove_grape_sort') do
      fa_icon('times', title: 'Удалить сорт') + ' Удалить'
    end
  end
  # nested_finish
end
