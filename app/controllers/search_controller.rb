class SearchController < ApplicationController
  def new
    @search = Search.new
    puts @search.inspect # Add this line to check @search object
    @filters = @search.available_filters
    @sorting_options = @search.available_sorting_options
    @popular_search_terms = @search.popular_search_terms(10)
  end


  def create
    @search = Search.new(search_params)
    puts @search.id

    if @search.save
      redirect_to @search
    else
      @filters = @search.available_filters
      @sorting_options = @search.available_sorting_options
      @popular_search_terms = @search.popular_search_terms(10)
      render :new
    end
  end

  def show
    @search = Search.find(params[:id])
    @results = @search.search_results(params[:page])
  end

  private

  def search_params
    params.require(:search).permit(
      :name,
      :description,
      :keyword,
      filter_ids: [],
      sorting_option_ids: [],
      filters_and_sorting: {}
    )
  end
end
