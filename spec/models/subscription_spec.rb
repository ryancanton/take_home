require 'rails_helper'

RSpec.describe Subscription do
  describe 'associations' do
    it {should belong_to(:customer)}
    it {should belong_to(:tea)}
  end

  describe 'methods' do
    before(:each) do
      @cstmr = Customer.create!({name: 'Hillary Jenkins', email: 'hj@email.com', address: '321 road'}).id
      @tea = Tea.create!({title: 'Earl Grey Tea', description: 'earthy English tea', temp: 120, brew_time: 2, price: 7}).id
    end

    describe 'self.make_subscription' do
      it 'should make a subscription obj based on params' do
        freq = 5

        Subscription.make_subscription(freq, @tea, @cstmr)
        expect(Subscription.all.count).to eq(1)
        sub = Subscription.last

        expect(sub.title).to eq("Earl Grey Subscription")
        expect(sub.price).to eq(7)
        expect(sub.active).to eq(true)
        expect(sub.frequency).to eq(freq)
        expect(sub.customer.id).to eq(@cstmr)
        expect(sub.tea.id).to eq(@tea)
      end
    end

    describe 'change_status' do
      it 'should change the active column to true or false, respectively' do
        subscriptions = Subscription.create!([{title: 'Earl Grey Subscription', price: 7, active: true, frequency: 3, customer_id: @cstmr, tea_id: @tea}, 
        {title: 'Earl Grey Subscription', price: 7, active: false, frequency: 3, customer_id: @cstmr, tea_id: @tea}])

        subscriptions[0].change_status
        subscriptions[1].change_status

        expect(subscriptions[0].active).to eq(false)
        expect(subscriptions[1].active).to eq(true)
      end
    end
  end
end