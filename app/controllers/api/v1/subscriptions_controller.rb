class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.make_subscription(params[:frequency], params[:tea_id], params[:customer_id])
    render json: SubscriptionSerializer.new(subscription)
  end

  def update

  end
end