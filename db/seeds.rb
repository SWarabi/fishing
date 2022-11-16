# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   password: '111111',
    admin: true
)

users = User.create!(
  [
    {email: 'olivia@test.com', name: '水野ウォーター', password: 'password'},
    {email: 'james@test.com', name: '海野月', password: 'password'},
    {email: 'lucas@test.com', name: 'サンプル太郎', password: 'password'}
  ]
)

catch = Catch.create!(
  [
    {fish: '真鯛', gear: 'ルアー', day: Date.new(2017,01,01), time: Date.new(2017,01,01), point: '江ノ島',user_id: users[0].id, is_draft: false },
    {fish: '石鯛', gear: 'ルアー', day: Date.new(2017,01,01), time: Date.new(2017,01,01), point: '江ノ島',user_id: users[1].id, is_draft: false },
    {fish: 'アオリイカ', gear: 'ルアー', day: Date.new(2017,01,01), time: Date.new(2017,01,01), point: '江ノ島',user_id: users[2].id, is_draft: false },
    {fish: '真鯛', gear: 'ルアー', day: Date.new(2017,01,02), time: Date.new(2017,01,02), point: '江ノ島',user_id: users[0].id, is_draft: false },
    {fish: '石鯛', gear: 'ルアー', day: Date.new(2017,01,02), time: Date.new(2017,01,02), point: '江ノ島',user_id: users[1].id, is_draft: false },
    {fish: 'アオリイカ', gear: 'ルアー', day: Date.new(2017,01,02), time: Date.new(2017,01,02), point: '江ノ島',user_id: users[2].id, is_draft: false },
    {fish: '真鯛', gear: 'ルアー', day: Date.new(2017,01,03), time: Date.new(2017,01,03), point: '江ノ島',user_id: users[0].id, is_draft: false },
    {fish: '石鯛', gear: 'ルアー', day: Date.new(2017,01,03), time: Date.new(2017,01,03), point: '江ノ島',user_id: users[1].id, is_draft: false },
    {fish: 'アオリイカ', gear: 'ルアー', day: Date.new(2017,01,03), time: Date.new(2017,01,03), point: '江ノ島',user_id: users[2].id, is_draft: false },
    {fish: '真鯛', gear: 'ルアー', day: Date.new(2017,01,04), time: Date.new(2017,01,04), point: '江ノ島',user_id: users[0].id, is_draft: false },
    {fish: '石鯛', gear: 'ルアー', day: Date.new(2017,01,04), time: Date.new(2017,01,04), point: '江ノ島',user_id: users[1].id, is_draft: false },
    {fish: 'アオリイカ', gear: 'ルアー', day: Date.new(2017,01,04), time: Date.new(2017,01,04), point: '江ノ島',user_id: users[2].id, is_draft: false },
  ]
)
