class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blogs_params)
    # respond_to do |format|
    if @blog.save
      #     format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
      #     format.json { render :show, status: :created, location: @blog }
      redirect_to blogs_path, notice: "ブログを作成しました！"
      #   else
      #     format.html { render :new }
      #     format.json { render json: @blog.errors, status: :unprocessable_entity }
      # render 'new'
      #   end
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    # respond_to do |format|
    if @blog.update(blogs_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
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
    @blog = Blog.find(params[:id])
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "ブログを削除しました！" }
      format.json { head :no_content }
    end
  end

  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end

  private
  def blogs_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
