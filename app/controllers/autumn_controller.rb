class AutumnController < ApplicationController
  before_action :set_autumn, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @autumns = Autumn.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @comment = @autumn.comments.build
    @comments = @autumn.comments
  end

  def new
    if params[:back]
      @autumn = Autumn.new(autumns_params)
    else
      @autumn = Autumn.new
    end
  end

  def create
    @autumn = current_user.autumns.build(autumns_params)
    if params[:cache][:image].present?
      @autumn.image.retrieve_from_cache! params[:cache][:image]
    end
    # respond_to do |format|
    if @autumn.save
      # format.html { redirect_to @warmspring, notice: 'warmspring was successfully created.' }
      #     format.json { render :show, status: :created, location: @blog }
      redirect_to autumn_index_path, notice: "ブログを作成しました！"
      NoticeMailer.sendmail_autumn(@autumn).deliver
    else
      #     format.html { render :new }
      #     format.json { render json: @blog.errors, status: :unprocessable_entity }
      render 'new'
      # end
    end
  end

  def edit
    @autumn = Autumn.find(params[:id])
  end

  def update
    @autumn = Autumn.find(params[:id])
    # respond_to do |format|
    if @autumn.update(autumns_params)
      redirect_to autumn_index_path, notice: "ブログを編集しました！"
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
    @autumn = Autumn.find(params[:id])
    @autumn.destroy
    respond_to do |format|
      format.html { redirect_to autumn_index_url, notice: "ブログを削除しました！" }
      format.json { head :no_content }
    end
  end

  def confirm
    @autumn = current_user.autumns.build(autumns_params)
    render :new if @autumn.invalid?
  end

  private
  def autumns_params
    params.require(:autumn).permit(:title, :content, :image)
  end

  def set_autumn
    @autumn = Autumn.find(params[:id])
  end
end
