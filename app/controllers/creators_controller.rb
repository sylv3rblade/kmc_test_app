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
    @creator = Creator.create(creator_params)
    creator_count
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @creator, notice: 'Creator was successfully deleted.' }
    end
  end

  def edit
  end

  def update
    @creator.update(creator_params)
    # assumes happy path for now
    creator_count
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @creator, notice: 'Creator was successfully updated.' }
    end
  end

  def destroy
    @creator.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to creators_path, notice: 'Creator was successfully deleted.' }
    end
  end

  private

  def set_creator
    @creator = Creator.find(params[:id])
  end

  def creator_params
    params.require(:creator).permit(:name, :email, :status)
  end

  def creator_count
    @index = Creator.count - 1 # not ideal but works for presentation
  end
end
