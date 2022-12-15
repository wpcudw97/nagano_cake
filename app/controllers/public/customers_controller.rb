class Public::CustomersController < ApplicationController
  def show
    @customers = Customer.page(params[:page])
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
end
