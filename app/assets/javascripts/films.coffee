
change_form_actor = ->
  $(".actor-select").change ->
    # Находим форму, которая находится в .actor-main-fields
    elem = $(this).parent().parent().parent().next().find(".actor-main-fields")
    # Если человек текущий, то форма редактирования
    if ($(this).val() == $(this).attr("data-current-id"))
      elem.html(elem.attr("data-content-exist"))
    # Если человек новый, то форма создания
    else if ($(this).val() == "")
      elem.html(elem.attr("data-content-new"))
    # Иначе выбран существующий человек и форму надо скрыть
    else
      elem.html("")
    window.datepicker_activation_by_item(elem)

# Удаление одной роли
@delete_one_ru_part = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
# Включаем все кнопки удаления
@del_all_rus_part = ->
  $('a.remove_part').on 'click', ->
    window.delete_one_ru_part($(this))
    false
  false

# Включаем кнопку добавления роли
@add_new_ru_part = ->
  $('#add_part_link').on 'click', ->
    # Подменяем временный id с фразой new_ru на случайной число
    new_id = new Date().getTime()
    regexp = new RegExp("new_part", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    # Вставляем на страницу
    $(this).parent().parent().after(content)

    # Достать из страницы новую форму создания человека
    elem = $(".panel-info").first().find(".actor-change").next()
    data = elem.attr("data-content")
    elem.attr("data-content", elem.html())
    elem.html(data)
    elem.prev().remove()

    panel = $(this).parent().parent().parent().find('.panel-info').first()

    elem = $(this).parent().parent().next().find(".actor-main-fields")
    elem.html(elem.attr("data-content-new"))
    change_form_actor()
    window.datepicker_activation_by_item(panel)

    # Включаем у новой роли кнопку удаления
    # Её раньше не было, поэтому при зарузке страницы она не включалась
    panel.find('a.remove_part').on 'click', ->
      window.delete_one_ru_part($(this))
      false
    false
# Запуск всего вышеописанного
ru_ready_films = ->
  window.add_new_ru_part()
  window.del_all_rus_part()
  change_form_actor()


$(document).on 'page:load', ru_ready_films # Включаем при ajax обновлении страницы
$(document).ready ru_ready_films # Включаем при обычном обновлении страницы
