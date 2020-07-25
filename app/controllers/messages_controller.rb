class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy, :edit]

  def index
    @messages = Message.all.includes(:user).page(params[:page]).per(3)
    # @messages = Message.all.page(params[:page])
  end

  def show
  end
  def new
    @message = Message.new
  end


  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end



  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :content , :image , :user_id)
  end

end
