class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])

    if @cat.update(cat_params)
      flash[:success] = "cat with id: #{params[:id]} updated"
      redirect_to owner_path(@cat.owner_id)
    else
      flash[:error] = "cat with id: #{params[:id]} not updated"
      render :edit
    end
  end

  def new
    @cat = Cat.new
    @owner = Owner.where(id: params[:owner_id])
  end

  def destroy
    @cat = Cat.find(params[:id])
    if @cat.destroy
      flash[:success] = "cat destroyed"
    end
    redirect_to owner_path(@cat.owner_id)
  end

  def create
    @owner = Owner.where(id: params[:id])
    @cat = Cat.new(cat_params)
    if @cat.save
      flash[:success] = "cat was successfully saved."
      redirect_to owner_path(@cat.owner_id)
    else
      flash[:error] = "cat was not succesfully saved."
      render :new
    end
  end

  private
    def cat_params
      params.require(:cat).permit(:owner_id, :name, :age, :fur_color, :eye_color, :food_type)
    end
end
