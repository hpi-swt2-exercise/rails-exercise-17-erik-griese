class PapersController < ApplicationController

  def index
    params_safe = paper_index_params
    @papers = []
    if params_safe.has_key?(:year)
      @papers = Paper.with_year(params_safe[:year].to_i)
    else
      @papers = Paper.all
    end
  end

  def show
    @paper = Paper.find(params[:id])
  end
  
  def new
    @paper = Paper.new
  end

  def create
    params_safe = convert_year(paper_params)
    convert_author_ids(params_safe)

    @paper = Paper.new(params_safe)

    if @paper.save
      redirect_to @paper
    else
      render 'new'
    end
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  def update
    @paper = Paper.find(params[:id])
    params_safe = convert_year(paper_params)
    convert_author_ids(params_safe)

    if @paper.update(params_safe)
      redirect_to @paper
    else
      render 'edit'
    end
  end

  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy

    redirect_to papers_path
  end


  private
    def paper_params
      params.require(:paper).permit(:title, :venue, :year, :author_ids => [])
    end

    def paper_index_params
      params.permit(:year)
    end

    def convert_year(params_safe)
      if not params_safe.has_key?(:year)
        return params_safe
      end

      converted_params = params_safe
      num_string = params_safe[:year]
      num = num_string.to_i
      converted_params[:year] = if num.to_s == num_string then num else num_string end

      return converted_params
    end

    def convert_author_ids(params_safe)
      if not params_safe.has_key?(:author_ids)
        return params_safe
      end

      params_safe[:author_ids].delete_if { |element| element.empty? }
      params_safe[:author_ids].map! { |id_string| id_string.to_i }
      return params_safe
    end
end
