# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding :'

puts 'Destroying previous seeds...'

Participation.destroy_all
Mission.destroy_all
User.destroy_all

puts 'Creating new seeds...'

User.create!(
  first_name: 'Mavrock',
  last_name: 'Dumb',
  birthday: Date.current - 18.years,
  email: 'mavrock@gmail.com',
  password: 'coucou'
)

User.create!(
  first_name: 'Jojokido',
  last_name: 'Susu',
  birthday: Date.new(1991,2,3),
  email: 'jojokido@gmail.com',
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
  first_name: 'Fwanck',
  last_name: 'The_king',
  birthday: Date.new(1990,3,1),
  email: 'admin@gmail.com',
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
  first_name: 'Michael',
  last_name: 'Boloss',
  birthday: Date.new(1995,3,1),
  email: 'michael@gmail.com',
  password: 'coucou'
)

Mission.create!(
  title: 'Cherche quelqu\'un pour déménagement',
  category: 'Demenagement',
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
  number_of_participants: 2,
  user: User.first(2).last
)

Mission.create!(
  title: 'Cherche 2 personnes pour venir me faire a manger ce soir?',
  category: 'Cuisine',
  description: 'La flemme de cuisiner',
  reward: 10,
  place: '39 rue de rome, Marseille',
  start_date: DateTime.now - 10.day,
  end_date: DateTime.now - 9.day,
  number_of_participants: 2,
  user: User.first(1).last
)

Mission.create!(
  title: 'Garde d\'un chaton',
  category: 'Animaux',
  description: 'Il me faut quelqu\'un pour me garder mon chat 4 jours pendant que je pars en week end',
  reward: 100,
  place: '71 rue Sainte, Marseille',
  start_date: DateTime.now - 2.day,
  end_date: DateTime.now + 2.day,
  number_of_participants: 2,
  user: User.first(5).last
)

Mission.create!(
  title: 'Location de mon bébé',
  category: 'Animaux',
  description: 'J\'en ai marre il fait que pleurer, il me faut quelqu\'un pour le garder pendant 1 semaine',
  reward: 5,
  place: '231 Avenue Pierre Mendès France, Marseille',
  start_date: DateTime.now + 2.day,
  end_date: DateTime.now + 6.day,
  number_of_participants: 1,
  user: User.find_by(first_name: 'Mavrock')
)

Mission.create!(
  title: 'Il me faut de l\'huile d\'olive',
  category: 'Service',
  description: 'J\'en ai besoin pour ma salade, qui va m\'en chercher? (Je paye 0€ car je suis un rat)',
  reward: 0,
  place: '167 Rue Paradis, 13006 Marseille',
  start_date: DateTime.now + 0.day,
  end_date: DateTime.now + 0.day,
  number_of_participants: 1,
  user: User.find_by(first_name: 'Mavrock')
)

Mission.create!(
  title: 'Location bébé',
  category: 'Animaux',
  description: 'Il fait 10kg, il a 2 mois, et il aime les sardines',
  reward: 100,
  place: '30 Avenue Joseph Vidal, 13008 Marseille',
  start_date: DateTime.now + 2.day,
  end_date: DateTime.now + 6.day,
  number_of_participants: 2,
  user: User.find_by(first_name: 'Michael')
)

Participation.create!(
  mission: Mission.find_by(title: 'Location bébé'),
  user: User.find_by(first_name: 'Fwanck')
)

Participation.create!(
  mission: Mission.find_by(title: 'Cherche quelqu\'un pour déménagement'),
  user: User.find_by(first_name: 'Michael')
)

Participation.create!(
  mission: Mission.find_by(title: 'Cherche quelqu\'un pour déménagement'),
  user: User.find_by(first_name: 'Jojokido')
)

Participation.create!(
  mission: Mission.find_by(title: 'Mon ordinateur est en panne, HELP'),
  user: User.find_by(first_name: 'Fwanck')
)


puts 'Finished!'
