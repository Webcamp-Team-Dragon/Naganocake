class Admin::GenresController < ApplicationController
  # GET	/admin/genres
  def index
    @genres = Genre.all
  end

# POST	/admin/genres
  def create
  end
  
  def show
    @genre = Genre.find(params[:id])
  end

# GET	/admin/genres/:id/edit
  def edit
  end

# PATCH	/admin/genres/:id
  def update
  end
end
