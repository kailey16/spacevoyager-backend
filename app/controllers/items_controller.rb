class ItemsController < ApplicationController
  before_action :authorized

  def myitems
    userItems = current_user.libraries.map{|lib| lib.items}.flatten
    
    render json: userItems
  end

end
