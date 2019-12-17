class SaveItemsController < ApplicationController
  before_action :authorized

  def create
    library = params[:library]
    image = params[:image]
    if image.data
      Item.find_or_create_by(
        category: "nasalibrary",
        api_id: image.id,
        media_url: ,
        title: ,
        media_type: ,
        description: ,
        date_uploaded: ,
        library_id: library.id
      )
    else 
      Item.find_or_create_by(
        category: "marsrover",
        api_id: image.id,
        media_url: ,
        title: ,
        media_type: ,
        description: ,
        date_uploaded: ,
        library_id: library.id
      )
    end

  end

  def destroy
  end

end
