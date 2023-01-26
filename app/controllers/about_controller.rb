class AboutController < ApplicationController

  def index
    @user = User.all
    puts @user.count
  end

end
