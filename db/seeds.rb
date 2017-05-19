if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)


#------------>Кинотеатр
a1 = Cinema.create!(name: 'Кинотеатр №1',address: 'улица дом 1')
a2 = Cinema.create!(name: 'Кинотеатр №2',address: 'улица дом 2')


#------------>Фильм
b1 = Film.create!(name: 'Тест №1', genre: 'Тест', lasting: 'Тест' , country: 'Тест',companies: 'Тест',min_age: '1')
b2 = Film.create!(name: 'Тест №2', genre: 'Тест', lasting: 'Тест' , country: 'Тест',companies: 'Тест',min_age: '2')


#----------->Актёр
c1 = Actor.create!(ln: 'Воронин', fn: 'Алексей', sn: 'Владимирович',birthday: '29.06.1989',)
c2 = Actor.create!(ln: 'Сорока', fn: 'Данил', sn: 'Юрьевич',birthday: '17.02.1985')


#----------->Адрес
d1 = Address.create!(film_id: b1.id, cinema_id: a1.id)
d2 = Address.create!(film_id: b2.id, cinema_id: a2.id)


#----------->Актёр:фильм
e1 = Part.create!(role: '1', film_id: b1.id, actor_id: c1.id)
e2 = Part.create!(role: '2', film_id: b2.id, actor_id: c2.id)
