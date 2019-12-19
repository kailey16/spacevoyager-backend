class SaveItemsController < ApplicationController
  before_action :authorized

  def create
    library = params[:library]
    image = params[:image]
    
    if image["data"]
      item = Item.find_or_create_by(
        category: "nasalibrary",
        api_id: image["data"][0]["nasa_id"],
        media_url: image["href"],
        title: image["data"][0]["title"],
        media_type: image["data"][0]["media_type"],
        description: image["data"][0]["description"],
        date_uploaded: image["data"][0]["date_created"]
      ) 
    else 
      item = Item.find_or_create_by(
        category: "marsrover",
        api_id: image["id"],
        media_url: image["img_src"],
        title: "Photo by Mars Rover camera",
        media_type: "image",
        description: "Taken by #{image["camera"]["name"]}, sol: #{image["sol"]}",
        date_uploaded: nil
      )
    end

    saveitem = SaveItem.find_or_create_by(item_id: item.id, library_id: library["id"])

    render json: item
  end

  def destroy
    item = SaveItem.find_by(library_id: params[:libId], item_id: params[:itemId]).destroy
    
    render json: item
  end

end
