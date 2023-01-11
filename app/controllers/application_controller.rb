class ApplicationController < ActionController::Base
  # before_action :authenticate_customer!, except: [:index, :show, :top, :about]

  def after_sign_out_path_for(resource)
    admin_root_path
  end

end