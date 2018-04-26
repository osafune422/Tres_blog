class PostsController < ApplicationController
  require 'date'
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end
  
  def new_posts
    @post = Post.new
  end
  
  def write
    @post = Post.new(
      user_id: @current_user.id,
      title: params[:title], 
      contents: params[:contents],
      date: Date.today
      )
    
    if @post.save
      flash[:notice] = "新規記事をアップしました"
      redirect_to("/show/#{@post.id}")
    else
      render("posts/new_posts")
    end
  end
  
  def edit_posts
    @post = Post.find_by(id: params[:id])
  end
  
  def update_posts
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.contents = params[:contents]
    @user = @post.user
    
    if @post.save
      flash.now[:notice] = "変更記事をアップしました"
      render("posts/show")
    else
      render("posts/edit_posts")
    end
  end
  
  def delete_posts
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end
  
  def delete
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "記事を削除しました"
    redirect_to("/mypage/#{@current_user.id}/#{@current_user.login_id}")
  end
  
end
