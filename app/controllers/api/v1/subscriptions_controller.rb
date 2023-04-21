class Api::V1::SubscriptionsController < ApplicationController
  def index
    subs = Customer.find(params[:customer_id]).subscriptions
    render json: SubscriptionSerializer.new(subs)
  end
  
  def create
    subscription = Subscription.make_subscription(params[:frequency], params[:tea_id], params[:customer_id])
    render json: SubscriptionSerializer.new(subscription)
  end

  def update
    subscription = Subscription.find(params[:id])
    if params[:change_status]
      subscription.change_status
      render json: SubscriptionSerializer.new(subscription)
    else
      render json: {Errors: "Invalid Arguments"}
    end
  end
end