class AuthorsController < ApplicationController
  def new
  end

  def create
    render plain: params[:author].inspect
    @author = Author.new(author_params)
    @author.save
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name, :homepage)
    end
end
