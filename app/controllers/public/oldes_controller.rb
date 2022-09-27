class Public::OldesController < ApplicationController
  def index
    # @catches = Catch.all
     @catches = Catch.where(is_draft: false).page(params[:page])
    # left_outer_joins(:favorites).group('catch.id').select('catches.*, COUNT(favorites.*) AS favorites_count').distinct.reorder(catches_count: :desc).limit(100)
  end
  
  
end
