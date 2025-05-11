class CreatorsController < ApplicationController
  before_action :set_creator, only: [:show, :edit, :update, :destroy]
  before_action :creator_count, only: [:create, :update]

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
      @index = index + 1 # because we called before save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @creator, notice: 'Creator was successfully deleted.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render :form, status: :unprocessable_entity }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @creator.update(creator_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @creator, notice: 'Creator was successfully updated.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render :form, status: :unprocessable_entity }
        format.html { render :edit, status: :unprocessable_entity }
      end
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
