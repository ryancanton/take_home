# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
teas = Tea.create([{title: 'Earl Grey Tea', description: 'earthy English tea', temp: 120, brew_time: 2},
    {title: 'Jasmine Tea', description: 'flowery green tea', temp: 125, brew_time: 3},
    {title: 'Mint Tea', description: 'peppermint tea', temp: 130, brew_time: 4}])

customers = Customer.create([{name: 'Bob Clifford', email: 'bc@email.com', address: '123 street'},
    {name: 'Hillary Jenkins', email: 'hj@email.com', address: '321 road'},
    {name: 'Cal Talmount', email: 'ct@email.com', address: '0 way'}])

subscriptions = Subscription.create([{title: 'Jasmine Subscription', price: 12, status: true, frequency: 3, customer_id: customers[0].id, tea_id: teas[1].id}, 
    {title: 'Earl Grey Subscription', price: 7, status: false, frequency: 2, customer_id: customers[0].id, tea_id: teas[0].id},
    {title: 'Jasmine Subscription', price: 12, status: false, frequency: 3, customer_id: customers[1].id, tea_id: teas[1].id},
    {title: 'Mint Subscription', price: 9, status: true, frequency: 4, customer_id: customers[1].id, tea_id: teas[2].id},
    {title: 'Earl Grey Subscription', price: 7, status: true, frequency: 3, customer_id: customers[2].id, tea_id: teas[0].id}])
