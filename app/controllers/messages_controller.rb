class MessagesController < ApplicationController
  def new
  end

  def index
    @messages = Message.all
  end

  def show
  end

  def edit
  end
end
