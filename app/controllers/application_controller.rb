class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:index, :show, :top, :about, :edit, :update]

end