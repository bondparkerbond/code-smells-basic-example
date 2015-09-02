class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])
    if @owner.update(owner_params)
      flash[:success] =  "Owner with name #{params[:owner][:first_name]} #{params[:owner][:last_name]} was updated successfully"
      redirect_to owners_path
    else
      flash[:error] = "Owner with name #{params[:owner][:first_name]} #{params[:owner][:last_name]} was not created successfully"
      render :edit
    end
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      flash[:success] = "Owner with name #{@owner.first_name} #{@owner.last_name} was created successfully"
      redirect_to owners_path
    else
      flash[:error] = "Owner with name #{params[:owner][:first_neme]} #{params[:owner][:last_name]} was not created successfully"
      render :new
    end
  end
  
  def edit
    @owner = Owner.find(params[:id])
  end

  def destroy
    @owner = Owner.find(params[:id])
    if @owner.destroy 
      flash[:success] = "owner destroyed"
      redirect_to owners_path
    else
      flash[:error] = "owner not destroyed because something happened with #{params[:id]}"
      redirect_to owners_path
    end 
  end

  # this method takes in an owner and sets its first cats age to 23
  # def some_method_that_does_something(owner)
  #   cats = owner.cats
  #   cat = owner.cats.first
  #   cat.age = 22
  #   cat.save
  # end

  private

    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :age, :race, :location)
    end
end
