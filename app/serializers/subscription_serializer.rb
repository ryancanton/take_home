class SubscriptionSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type 'subscription'
  attributes :title, :price, :active, :frequency, :customer_id, :tea_id
end