class WinterController < ApplicationController
  before_action :set_winter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @winters = Winter.all
  end

  def show
  end

  def new
    if params[:back]
      @winter = Winter.new(winters_params)
    else
      @winter = Winter.new
    end
  end

  def create
    @winter = Winter.new(winters_params)
    # respond_to do |format|
    if @winter.save
      # format.html { redirect_to @warmspring, notice: 'warmspring was successfully created.' }
      #     format.json { render :show, status: :created, location: @blog }
      redirect_to winter_index_path, notice: "ブログを作成しました！"
      #   else
      #     format.html { render :new }
      #     format.json { render json: @blog.errors, status: :unprocessable_entity }
      # render 'new'
      # end
    end
  end

  def edit
    @winter = Winter.find(params[:id])
  end

  def update
    @winter = Winter.find(params[:id])
    # respond_to do |format|
    if @winter.update(winters_params)
      redirect_to winter_index_path, notice: "ブログを編集しました！"
      #     format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      #     format.json { render :show, status: :ok, location: @blog }
    else
      render 'edit'
      # format.html { render :edit }
      #     format.json { render json: @blog.errors, status: :unprocessable_entity }
      # end
    end
  end

  def destroy
    @winter = Winter.find(params[:id])
    @winter.destroy
    respond_to do |format|
      format.html { redirect_to winter_index_url, notice: "ブログを削除しました！" }
      format.json { head :no_content }
    end
  end

  def confirm
    @winter = Winter.new(winters_params)
    render :new if @winter.invalid?
  end

  private
  def winters_params
    params.require(:winter).permit(:title, :content)
  end

  def set_winter
    @winter = Winter.find(params[:id])
  end
end
