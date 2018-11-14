class ItemsController < ApplicationController
  before_action :set_topic

  def new
    @item = @topic.items.new
  end

  def create
    @item = @topic.items.new(item_params)
    if @item.save
      redirect_to sub_topic_path(@topic.sub_id, @topic)
    else
      render :new
    end
  end

  private 
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def item_params
      params.require(:item).permit(:body, :author)
    end
end