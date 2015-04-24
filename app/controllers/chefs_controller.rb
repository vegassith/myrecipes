class ChefsController < ApplicationController
  def index
    @chefs = Chef.all
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def new
  @chef = Chef.new
  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

end