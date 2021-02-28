class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @restaurants = policy_scope(Restaurant)
  end
end
