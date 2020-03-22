# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def call
  10.times.with_index do |i|

    Owner.create(
      address: Faker::Address.street_address,
      apartment_number: Faker::Address.secondary_address,
      zip_code: Faker::Address.zip_code,
      door_code: Faker::Address.building_number,
      lockbox_code: Faker::Address.building_number,
      entry_instructions: Faker::ChuckNorris.fact,
      neighborhood: Faker::Address.community,
      phone2: Faker::PhoneNumber.cell_phone,
      phone: Faker::PhoneNumber.cell_phone,
      fname: Faker::Name.first_name,
      lname: Faker::Name.last_name,
      email: Faker::Internet.email
    )
  end

  Owner.all.each do |owner|
    owner.pets.build(
      name: Faker::Cannabis.strain,
      breed: Faker::Creature::Dog.breed,
      gender: Faker::Creature::Dog.gender,
      appearance: Faker::Creature::Dog.meme_phrase,
      notes: Faker::Creature::Dog.age,
      temperament: Faker::Creature::Dog.sound,
      birthday: Faker::Date.birthday(min_age: 0, max_age: 15).strftime('%Y-%m-%dT%H%M')
    ).save
  end

  Pet.all.each do |pet|
    date = DateTime.parse(Faker::Date.between(from: 1.days.ago, to: 5.days.from_now).to_s)
    start_time = Time.parse(date.to_s) + rand(0..7200)
    end_time = start_time + 3600

    pet.walks.build(
      date: date,
      window_start: start_time,
      window_end: end_time,
      notes: Faker::Movies::Lebowski.quote,
      walk_type: '30 min'
    ).save
  end
end

#call()
