module FilmsHelper
  def new_actor_form(form)
    new_object = Actor.new
    form.fields_for(:actor, new_object) do |ar|
      render('films/one_actor_form', ar: ar)
    end
  end

  def link_to_add_part(form)
    # Создаём новый объект. Аналог build в ранних примерах
    new_object = Part.new
    # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
    # Все role_users в форме имеют свой номер
    # Мы его пока заменям на фразу new_ru
    fields = form.fields_for(:parts, new_object,
      :child_index => 'new_part') do |fr|
      render('films/one_part_form', fr: fr, i: 'Новая')
    end
    # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
    link_to(?#, class: 'btn btn-info',
        id: 'add_part_link', data: {content: "#{fields}"}) do
      fa_icon("plus") + " Новая роль"
    end
  end

  def link_to_remove_part(form)
    # При удалении nested-конструкции. Она реально не удаляется
    # Соответствующий html-блок скрывается
    # При этом выставляется значение специального поля _destroy
    # По этому поля rails понимает, что связь надо удалить
    form.hidden_field(:_destroy, class: 'remove_fields') +
        # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
        link_to(?#, class: 'remove_fields remove_part') do
      fa_icon('times', title: 'Удалить роль') + ' Удалить'
    end
  end
end
