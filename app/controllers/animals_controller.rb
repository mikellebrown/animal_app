class AnimalsController < ApplicationController
  
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @animals = current_user.animals
  end

  def show
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = current_user.animals.new(animal_params)
      if @animal.save
        redirect_to animals_path
      else
        render :new
    end
  end

  def edit
 
  end
  
  def update
    if @animal.update(animal_params)
      redirect_to edit_animal_path
    else 
      render :edit
    end
  end

  def destroy
    @animal.destroy
    redirect_to animals_path
  end


private 

  def animal_params
    params.require(:animal).permit(:name, :species, :age)
  end

  def set_animal
    @animal = current_user.animals.find(params[:id])
  end

end