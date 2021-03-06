module CinemasHelper
  def link_to_add_address(form)
    # Создаём новый объект. Аналог build в ранних примерах
    new_object = Address.new
    # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
    # Все role_users в форме имеют свой номер
    # Мы его пока заменям на фразу new_ru
    fields = form.fields_for(:addresses, new_object,
      :child_index => 'new_address') do |fr|
      render('cinemas/one_address_form', fr: fr, i: 'Новая')
    end
    # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
    link_to(?#, class: 'btn btn-info',
        id: 'add_address_link', data: {content: "#{fields}"}) do
      fa_icon("plus") + " Новый адрес"
    end
  end

  def link_to_remove_address(form)
    # При удалении nested-конструкции. Она реально не удаляется
    # Соответствующий html-блок скрывается
    # При этом выставляется значение специального поля _destroy
    # По этому поля rails понимает, что связь надо удалить
    form.hidden_field(:_destroy, class: 'remove_fields') +
        # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
        link_to(?#, class: 'remove_fields remove_address') do
      fa_icon('times', title: 'Удалить адрес') + ' Удалить'
    end
  end
end
