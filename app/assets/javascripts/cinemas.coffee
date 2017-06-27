# Удаление одной роли
@delete_one_ru_address = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
# Включаем все кнопки удаления
@del_all_rus_address = ->
  $('a.remove_address').on 'click', ->
    window.delete_one_ru_address($(this))
    false
  false
# Включаем кнопку добавления роли
@add_new_ru_address = ->
  $('#add_address_link').on 'click', ->
    # Подменяем временный id с фразой new_ru на случайной число
    new_id = new Date().getTime()
    regexp = new RegExp("new_address", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    # Вставляем на страницу
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    # Если бы были даты с datepicker-ом
    # window.datepicker_activation_by_item(panel)
    # Включаем у новой роли кнопку удаления
    # Её раньше не было, поэтому при зарузке страницы она не включалась
    panel.find('a.remove_address').on 'click', ->
      window.delete_one_ru_address($(this))
      false
    false
# Запуск всего вышеописанного
ru_ready_address = ->
  window.add_new_ru_address()
  window.del_all_rus_address()

$(document).on 'page:load', ru_ready_address # Включаем при ajax обновлении страницы
$(document).ready ru_ready_address # Включаем при обычном обновлении страницы
