class Admin::DashboardController < ApplicationController
  #include HttpAuthConcern
  http_basic_authenticate_with name: ENV['STRIPE_USERNAME'], password: ENV['STRIPE_PASSWORD']
  def show
  end
end
