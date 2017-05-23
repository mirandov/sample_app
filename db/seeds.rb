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
ru2 = RoleUser.create(role: r2, user: u2)
#------------------------------------------------------------------------------#
#Сорта винограда

  g1 = GrapeSort.create!(name: 'Аспиран', place_of_growth: 'Франция', date_of_collection: '01.02.2000')

  g2 = GrapeSort.create!(name: 'Кабарне', place_of_growth: 'Франция', date_of_collection: '01.02.1997')

  g3 = GrapeSort.create!(name: 'Цезар', place_of_growth: 'Италия', date_of_collection: '04.09.2007')

  g4 = GrapeSort.create!(name: 'Трусо', place_of_growth: 'Испания', date_of_collection: '01.07.1996')

  g5 = GrapeSort.create!(name: 'Аспиран', place_of_growth: 'Франция', date_of_collection: '01.02.2001')
  g6 = GrapeSort.create!(name: 'Аспиран', place_of_growth: 'Франция', date_of_collection: '01.07.1996')
  g7 = GrapeSort.create!(name: 'Аспиран', place_of_growth: 'Италия', date_of_collection: '01.07.1996')
  g8 = GrapeSort.create!(name: 'Кишмиш', place_of_growth: 'Италия', date_of_collection: '01.07.1996')




#------------------------------------------------------------------------------#
#Сорт вина

  w1 = WineSort.create!(name: 'Шираз', type_of_wine: 'Сухое',
   color: 'Белое', barrel_extract: '4', bottle_extract: '9')

  w2 = WineSort.create!(name: 'Кабарне Савиньон', type_of_wine: 'Полусладкое',
   color: 'Красное', barrel_extract: '5', bottle_extract: '7')

  w3 = WineSort.create!(name: 'Шардане', type_of_wine: 'Сладкое',
   color: 'Розовое', barrel_extract: '10', bottle_extract: '11')

  w4 = WineSort.create!(name: 'Мерло', type_of_wine: 'Полусухое',
   color: 'Красное', barrel_extract: '3', bottle_extract: '4')
  w4 = WineSort.create!(name: 'Мерло', type_of_wine: 'Полусухое',
   color: 'Белое', barrel_extract: '3', bottle_extract: '4')

#------------------------------------------------------------------------------#
#Бочки
  b1 = Barrel.create!(location: 'Франция', date_of_manufacture: '20.04.1996',
   amount: '50.0', is_empty: 'Не пустая', date_of_completion: '12.04.2004',
   wine_sort: w1)


  b2 = Barrel.create!(location: 'Франция', date_of_manufacture: '20.04.1999',
   amount: '30.0', is_empty: 'Не пустая', date_of_completion: '02.04.2007',
   wine_sort: w2)


  b3 =Barrel.create!(location: 'Италия', date_of_manufacture: '20.04.1996',
   amount: '50.0', is_empty: 'Не пустая', date_of_completion: '29.09.2001',
   wine_sort: w3)


  b4 = Barrel.create!(location: 'Италия', date_of_manufacture: '31.10.1998',
   amount: '50.0', is_empty: 'Не пустая', date_of_completion: '20.07.1999',
   wine_sort: w4)


  b5 = Barrel.create!(location: 'Италия', date_of_manufacture: '31.10.1998',
   amount: '50.0', is_empty: 'Не пустая', date_of_completion: '14.09.2001',
   wine_sort: w1)


 #------------------------------------------------------------------------------#
 #Соотношение

   relation1 = Relationship.create!(ratio: '30%', grape_sort: g1, wine_sort: w1)

   relation2 = Relationship.create!(ratio: '20%', grape_sort: g2, wine_sort: w1)
   relation22 = Relationship.create!(ratio: '50%', grape_sort: g4, wine_sort: w1)

   relation3 = Relationship.create!(ratio: '60%', grape_sort: g1, wine_sort: w2)

   relation4 = Relationship.create!(ratio: '40%', grape_sort: g4, wine_sort: w2)

   relation5 = Relationship.create!(ratio: '20%', grape_sort: g3, wine_sort: w3)

   relation6 = Relationship.create!(ratio: '80%', grape_sort: g2, wine_sort: w3)

   relation7 = Relationship.create!(ratio: '75%', grape_sort: g2, wine_sort: w4)

   relation8 = Relationship.create!(ratio: '25%', grape_sort: g4, wine_sort: w4)
