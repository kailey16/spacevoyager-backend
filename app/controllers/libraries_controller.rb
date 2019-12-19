class LibrariesController < ApplicationController
  before_action :authorized

  def mylibraries
    render json: current_user.libraries
  end

  def show
    libId = params[:id]
    items = Library.find(libId).items

    render json: items
  end

  def create
    name = params["libName"]
    description = params["libDescription"]
    newLib = Library.find_or_create_by(user_id: current_user.id, title: name, description: description)

    render json: newLib
  end

  def destroy
    deletedLib = Library.destroy(params[:id])

    render json: deletedLib
  end

end
