class KeywordsController < ApplicationController
  before_action :set_keyword, only: [:destroy]

  def destroy
    @keyword.destroy
  end

  private

  def set_keyword
    @keyword = Keyword.find(params[:id])
    authorize @keyword
  end
end
