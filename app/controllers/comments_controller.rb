class CommentsController < ApplicationController

  before_action :set_comment_topic, only: [:show, :edit, :update, :destroy]

  #action for save and post comments
  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    #@notification = @comment.notifications.build(user_id: @topic.user.id)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました'}
        format.js { render :index }
        #unless @comment.topic.user_id == current_user.id
          #Pusher.trigger("user_#{@comment.topic.user_id}_channel",'comment_created',{
            #message: 'あなたの作成したトピックにコメントが付きました'
            #})
        #end
        #Pusher.trigger("user_#{@comment.topic.user_id}_channel",'notification_created',{
          #unread_counts: Notification.where(user_id: @comment.topic.user_id, read: false).count
          #})
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @topic = @comment.topic
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to topic_path(@topic), notice: 'コメントを削除しました'}
      format.js { render :index }
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to topic_path(@topic), notice:"コメントを編集しました"
    else
      render 'edit'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end

    def set_comment_topic
      @comment = Topic.find(params[:topic_id]).comments.find(params[:id])
      @topic = @comment.topic
    end
end
