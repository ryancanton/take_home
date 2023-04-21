require 'rails_helper'

RSpec.describe "Subscriptions requests" do
  describe 'post /api/v1/subscriptions' do
    it 'can create a subscrition when given correct params' do
      cstmr = Customer.create!({name: 'Hillary Jenkins', email: 'hj@email.com', address: '321 road'}).id
      tea = Tea.create!({title: 'Earl Grey Tea', description: 'earthy English tea', temp: 120, brew_time: 2, price: 7}).id

      sub_params = {     
        customer_id: cstmr,
        tea_id: tea,
        frequency: 7
      }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/subscriptions', headers: headers, params: JSON.generate(sub_params)
      expect(Subscription.all.count).to eq(1)
      expect(response).to be_successful

      sub_json = JSON.parse(response.body, symbolize_names: true)[:data]
      sub = Subscription.last
      expect(sub_json[:id]).to eq(sub.id.to_s)
      expect(sub_json[:type]).to eq('subscription')
      expect(sub_json[:attributes][:title]).to eq(sub.title)
      expect(sub_json[:attributes][:price]).to eq(sub.price)
      expect(sub_json[:attributes][:active]).to eq(sub.active)
      expect(sub_json[:attributes][:frequency]).to eq(sub.frequency)
      expect(sub_json[:attributes][:customer_id]).to eq(sub.customer.id)
      expect(sub_json[:attributes][:tea_id]).to eq(sub.tea.id)
    end
  end

  describe 'patch /api/v1/subscriptions/:id' do
    it 'will change the active column on a subscription' do
      cstmr = Customer.create!({name: 'Hillary Jenkins', email: 'hj@email.com', address: '321 road'}).id
      tea = Tea.create!({title: 'Earl Grey Tea', description: 'earthy English tea', temp: 120, brew_time: 2, price: 7}).id
      subscription = Subscription.create!({title: 'Earl Grey Subscription', price: 7, active: true, frequency: 3, customer_id: cstmr, tea_id: tea})
      
      sub_params = {     
        change_status: true
      }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      patch "/api/v1/subscriptions/#{subscription.id}", headers: headers, params: JSON.generate(sub_params)
      expect(Subscription.all.count).to eq(1)
      expect(response).to be_successful

      sub_json = JSON.parse(response.body, symbolize_names: true)[:data]
      sub = Subscription.last
      expect(sub_json[:id]).to eq(sub.id.to_s)
      expect(sub_json[:type]).to eq('subscription')
      expect(sub_json[:attributes][:title]).to eq(sub.title)
      expect(sub_json[:attributes][:price]).to eq(sub.price)
      expect(sub_json[:attributes][:active]).to eq(false)
      expect(sub_json[:attributes][:frequency]).to eq(sub.frequency)
      expect(sub_json[:attributes][:customer_id]).to eq(sub.customer.id)
      expect(sub_json[:attributes][:tea_id]).to eq(sub.tea.id)
    end
  end

  describe 'get /api/v1/subscriptions' do
    it 'will return all of a customers subscriptions when given id value' do
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

        
        headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
        get "/api/v1/subscriptions?customer_id=#{customers[0].id}", headers: headers
        expect(response).to be_successful
        sub_json = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(sub_json.count).to eq(2)
        sub_json.each do |sub|
          expect(sub[:attributes][:customer_id]).to eq(customers[0].id)
        end
    end
  end
end