class DirectorsController < ApplicationController
  def new
    @director = Director.new
  end

  def show
    @director = Director.find(params[:id])
  end

  def create
    @director = Director.create(director_params)
    if @director.save
      redirect_to @director
    else
      render :new
    end
  end

  private

  def director_params
    params.require(:director).permit(:name)
  end
end