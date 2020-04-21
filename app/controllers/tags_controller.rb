class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(tag_params[:id])
  end

  def destroy
    tag = Tag.find(tag_params[:id])
    flash.notice = "Tag '#{tag.name}' was Deleted!"

    tag.destroy
    redirect_to tags_path
  end

  private
    def tag_params
      params.permit(:id)
    end
end