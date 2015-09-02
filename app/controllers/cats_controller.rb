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
      redirect_to cats_path
    else
      flash[:error] = "cat with id: #{params[:id]} not updated"
      render :edit
    end
  end

  def new
    @cat = Cat.new
  end

  def destroy
    @cat = Cat.find(params[:id])
    if @cat.destroy
      flash[:success] = "cat destroyed"
    end
    redirect_to cats_path
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      flash[:success] = "cat was successfully saved."
      redirect_to cats_path
    else
      flash[:error] = "cat was not succesfully saved."
      render :new
    end
  end

  private
    def cat_params
      params.require(:cats).permit(:name, :age, :fur_color, :eye_color, :food_type)
    end
end
