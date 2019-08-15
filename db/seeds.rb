# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Participation.destroy_all
Mission.destroy_all
User.destroy_all

User.create!(
  first_name: 'Satoshi',
  last_name: 'Nakamoto',
  birthday: Date.current - 18.years,
  email: 'satoshi@gmail.com',
  password: 'coucou'
)

User.create!(
  first_name: 'Roakin',
  last_name: 'Le_susu',
  birthday: Date.new(1991,2,3),
  email: 'roakin@gmail.com',
  password: 'coucou'
)

User.create!(
  first_name: 'Theo',
  last_name: 'Lembrouille',
  birthday: Date.new(1993,4,5),
  email: 'theo@gmail.com',
  password: 'coucou'
)

User.create!(
  first_name: 'Rem',
  last_name: 'Bgnvngbn',
  birthday: Date.new(1992,3,1),
  email: 'rem@gmail.com',
  password: 'coucou'
)

User.create!(
  first_name: 'Admin',
  last_name: 'Cest_moi',
  birthday: Date.new(1992,3,1),
  email: 'admin@gmail.com',
  password: 'coucou'
)

Mission.create!(
  title: 'Cherche quelqu\'un pour déménagement',
  category: 'Adulte',
  description: 'Besoin de gros bras',
  reward: 200,
  place: '41 Rue Jobin, 13003 Marseille',
  start_date: DateTime.now,
  end_date: DateTime.tomorrow,
  number_of_participants: 4,
  user: User.first(3).last
)

Mission.create!(
  title: 'Mon ordinateur est en panne, HELP',
  category: 'Equipements',
  description: 'Wallah ca marche pas',
  reward: 5,
  place: '109 Avenue de la Jarre, 13009 Marseille',
  start_date: DateTime.now - 5.day,
  end_date: DateTime.now - 4.day,
  number_of_participants: 1,
  user: User.first(2).last
)

Mission.create!(
  title: 'Quelqu\'un pour venir me faire a manger ce soir?',
  category: 'Cuisine',
  description: 'La flemme de cuisiner',
  reward: 10,
  place: '39 rue de rome, Marseille',
  start_date: DateTime.now - 10.day,
  end_date: DateTime.now - 9.day,
  number_of_participants: 1,
  user: User.first(1).last
)

Mission.create!(
  title: 'Garde d\'un chaton',
  category: 'Animaux',
  description: 'Il me faut quelqu\'un pour me garder mon chat 1 semaine pendant que je pars en vacances',
  reward: 100,
  place: '71 rue Sainte, Marseille',
  start_date: DateTime.now - 2.day,
  end_date: DateTime.now + 5.day,
  number_of_participants: 1,
  user: User.first(5).last
)

Mission.create!(
  title: 'Location de mon bébé',
  category: 'Animaux',
  description: 'J\'en ai marre il fait que pleurer',
  reward: 100,
  place: '231 Avenue Pierre Mendès France, Marseille',
  start_date: DateTime.now + 2.day,
  end_date: DateTime.now + 6.day,
  number_of_participants: 1,
  user: User.first(4).last
)

Participation.create!(
  mission: Mission.first(2).last,
  user: User.first(5).last
)

Participation.create!(
  mission: Mission.first(2).last,
  user: User.first(3).last
)
Participation.create!(
  mission: Mission.first(2).last,
  user: User.first(2).last
)

Participation.create!(
  mission: Mission.first(1).last,
  user: User.first(1).last
)

Participation.create!(
  mission: Mission.first(1).last,
  user: User.first(3).last
)

Participation.create!(
  mission: Mission.first(3).last,
  user: User.first(2).last
)

Participation.create!(
  mission: Mission.first(3).last,
  user: User.first(5).last
)

Participation.create!(
  mission: Mission.first(3).last,
  user: User.first(4).last
)

Participation.create!(
  mission: Mission.first(3).last,
  user: User.first(3).last
)


Participation.create!(
  mission: Mission.first(4).last,
  user: User.first(3).last
)

Participation.create!(
  mission: Mission.first(4).last,
  user: User.first(2).last
)


Participation.create!(
  mission: Mission.first(4).last,
  user: User.first(1).last
)

Participation.create!(
  mission: Mission.first(5).last,
  user: User.first(4).last
)

Participation.create!(
  mission: Mission.first(5).last,
  user: User.first(1).last
)

puts 'Finished!'
