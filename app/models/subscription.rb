class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  def self.make_subscription(freq, tea, cstmr)
    Subscription.create(get_params(freq, tea, cstmr))
  end

  private 
  def self.get_params(freq, tea, cstmr)
    price = 0
    title = Tea.find(tea).title
    title["Tea"] = "Subscription"
    case tea
    when 0
      price = 7
    when 1
      price = 12
    when 2
      price = 9
    end
    {title: title, price: price, status: true, frequency: freq, customer_id: cstmr, tea_id: tea}
  end
end
