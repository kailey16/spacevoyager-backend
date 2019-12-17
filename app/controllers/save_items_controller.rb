class SaveItemsController < ApplicationController
  before_action :authorized

  def create
    library = params[:library]
    image = params[:image]
    byebug
    if image["data"]
      byebug
      item = Item.find_or_create_by(
        category: "nasalibrary",
        api_id: image["data"][0]["nasa_id"],
        media_url: image["href"],
        title: image["data"][0]["title"],
        media_type: image["data"][0]["media_type"],
        description: image["data"][0]["description"],
        date_uploaded: image["date_created"],
        library_id: library["id"]
      )
    else 
      item = Item.find_or_create_by(
        category: "marsrover",
        api_id: image["id"],
        media_url: image["img_src"],
        title: "sol: #{image["sol"]}",
        media_type: "image",
        description: "taken by #{image["camera"]["name"]}",
        date_uploaded: nil,
        library_id: library["id"]
      )
    end

    SaveItem.find_or_create_by(item_id: item.id, library_id: library["id"])

    render json: item
  end

  def destroy
  end

end
