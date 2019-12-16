class LibrariesController < ApplicationController
  
  def index

  end

  def create
    name = params["libraryName"]
    description = params["libraryDescription"]
    newLib = Library.find_or_create_by(user_id: current_user.id, title: name, description: description)

    render json: newLib
  end

  def destroy

  end

end
