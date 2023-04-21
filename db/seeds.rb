Subscription.destroy_all
Tea.destroy_all
Customer.destroy_all

teas = Tea.create([{title: 'Earl Grey Tea', description: 'earthy English tea', temp: 120, brew_time: 2, price: 7},
    {title: 'Jasmine Tea', description: 'flowery green tea', temp: 125, brew_time: 3, price: 12},
    {title: 'Mint Tea', description: 'peppermint tea', temp: 130, brew_time: 4, price: 9}])

customers = Customer.create([{name: 'Bob Clifford', email: 'bc@email.com', address: '123 street'},
    {name: 'Hillary Jenkins', email: 'hj@email.com', address: '321 road'},
    {name: 'Cal Talmount', email: 'ct@email.com', address: '0 way'}])

subscriptions = Subscription.create([{title: 'Jasmine Subscription', price: 12, active: true, frequency: 3, customer_id: customers[0].id, tea_id: teas[1].id}, 
    {title: 'Earl Grey Subscription', price: 7, active: false, frequency: 2, customer_id: customers[0].id, tea_id: teas[0].id},
    {title: 'Jasmine Subscription', price: 12, active: false, frequency: 3, customer_id: customers[1].id, tea_id: teas[1].id},
    {title: 'Mint Subscription', price: 9, active: true, frequency: 4, customer_id: customers[1].id, tea_id: teas[2].id},
    {title: 'Earl Grey Subscription', price: 7, active: true, frequency: 3, customer_id: customers[2].id, tea_id: teas[0].id}])
