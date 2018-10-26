class ContentsController < ApplicationController
  def update
  end

  def index
    @contents = policy_scope(Content)
  end
end
