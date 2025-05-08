class CreatorsController < ApplicationController
  before_action :set_creator, only: [:show, :edit, :update, :destroy]

  def index
    @creators = Creator.all
  end

  def show
  end

  def new
    @creator = Creator.new
  end

  def create
    @creator = Creator.new(creator_params)
    if @creator.save
      redirect_to @creator, notice: 'Creator was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @creator.update(creator_params)
      redirect_to @creator, notice: 'Creator was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @creator.destroy
    redirect_to creators_url, notice: 'Creator was successfully destroyed.'
  end

  private

  def set_creator
    @creator = Creator.find(params[:id])
  end

  def creator_params
    params.require(:creator).permit(:name, :email, :status)
  end
end
