class PapersController < ApplicationController

  def index
    @papers = Paper.all
  end

  def show
    @paper = Paper.find(params[:id])
  end
  
  def new
    @paper = Paper.new
  end

  def create
    params_safe = paper_params
    if params_safe.has_key?(:year)
      try_convert_year(params_safe)
    end

    @paper = Paper.new(params_safe)

    if @paper.save
      redirect_to @paper
    else
      render 'new'
    end
  end

  private
    def paper_params
      params.require(:paper).permit(:title, :venue, :year)
    end

    def try_convert_year(params_safe)
      num_string = params_safe[:year]
      num = num_string.to_i
      params_safe[:year] = if num.to_s == num_string then num else num_string end
    end
end
