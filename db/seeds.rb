Faker::UniqueGenerator.clear

Audition.destroy_all
Role.destroy_all

50.times do
    Role.create(
        character_name: Faker::Superhero.name
    )
end



100.times do
    Audition.create(
        actor: Faker::Name.name,
        location: Faker::Address.city,
        phone: Faker::Number.number(digits: 10),
        hired: false,
        role: Role.all.sample
    )
end
