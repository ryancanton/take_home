class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  def self.make_subscription(freq, tea, cstmr)
    Subscription.create(get_params(freq, tea, cstmr))
  end

  def change_status
    curr_status = self.active
    self.update(active: !curr_status)
  end

  private 
  def self.get_params(freq, tea, cstmr)
    tea_obj = Tea.find(tea)
    price = tea_obj.price
    title = tea_obj.title
    title["Tea"] = "Subscription"
    
    {title: title, price: price, active: true, frequency: freq, customer_id: cstmr, tea_id: tea}
  end
end
