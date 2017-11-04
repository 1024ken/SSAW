class SummerController < ApplicationController
  before_action :set_summer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @summers = Summer.all
  end

  def show
  end

  def new
    if params[:back]
      @summer = Summer.new(summers_params)
    else
      @summer = Summer.new
    end
  end

  def create
    @summer = Summer.new(summers_params)
    # respond_to do |format|
    if @summer.save
      # format.html { redirect_to @warmspring, notice: 'warmspring was successfully created.' }
      #     format.json { render :show, status: :created, location: @blog }
      redirect_to summer_index_path, notice: "ブログを作成しました！"
      #   else
      #     format.html { render :new }
      #     format.json { render json: @blog.errors, status: :unprocessable_entity }
      # render 'new'
      # end
    end
  end

  def edit
    @summer = Summer.find(params[:id])
  end

  def update
    @summer = Summer.find(params[:id])
    # respond_to do |format|
    if @summer.update(summers_params)
      redirect_to summer_index_path, notice: "ブログを編集しました！"
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
    @summer = Summer.find(params[:id])
    @summer.destroy
    respond_to do |format|
      format.html { redirect_to summer_index_url, notice: "ブログを削除しました！" }
      format.json { head :no_content }
    end
  end

  def confirm
    @summer = Summer.new(summers_params)
    render :new if @summer.invalid?
  end

  private
  def summers_params
    params.require(:summer).permit(:title, :content)
  end

  def set_summer
    @summer = Summer.find(params[:id])
  end
end
