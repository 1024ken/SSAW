class WarmspringController < ApplicationController
  before_action :set_warmspring, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @warmsprings = Warmspring.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @comment = @warmspring.comments.build
    @comments = @warmspring.comments
  end

  def new
    if params[:back]
      @warmspring = Warmspring.new(warmsprings_params)
    else
      @warmspring = Warmspring.new
    end
  end

  def create
    @warmspring = current_user.warmsprings.build(warmsprings_params)
    if params[:cache][:image].present?
      @warmspring.image.retrieve_from_cache! params[:cache][:image]
    end
    # respond_to do |format|
    if @warmspring.save
      # format.html { redirect_to @warmspring, notice: 'warmspring was successfully created.' }
      #     format.json { render :show, status: :created, location: @blog }
      redirect_to warmspring_index_path, notice: "ブログを作成しました！"
      NoticeMailer.sendmail_warmspring(@warmspring).deliver
    else
      #     format.html { render :new }
      #     format.json { render json: @blog.errors, status: :unprocessable_entity }
      render 'new'
      # end
    end
  end

  def edit
    @warmspring = Warmspring.find(params[:id])
  end

  def update
    @warmspring = Warmspring.find(params[:id])
    # respond_to do |format|
    if @warmspring.update(warmsprings_params)
      redirect_to warmspring_index_path, notice: "ブログを編集しました！"
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
    @warmspring = Warmspring.find(params[:id])
    @warmspring.destroy
    respond_to do |format|
      format.html { redirect_to warmspring_index_url, notice: "ブログを削除しました！" }
      format.json { head :no_content }
    end
  end

  def confirm
    @warmspring = current_user.warmsprings.build(warmsprings_params)
    render :new if @warmspring.invalid?
  end

  def ranking
    @warmspring = Warmspring.ranking
    respond_to do |format|
      format.html
      format.json { render json: @warmspring }
    end
  end

  private
  def warmsprings_params
    params.require(:warmspring).permit(:title, :content, :image)
  end

  def set_warmspring
    @warmspring = Warmspring.find(params[:id])
  end
end
