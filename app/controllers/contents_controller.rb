class ContentsController < ApplicationController
  def update
  end

  def index
    @contents = policy_scope(Content)
    @facebook_images = spot("facebook", "image")
    @facebook_posts = spot("facebook", "post")
    @facebook_likes = spot("facebook","like")
  end

  def spot(provider, file_type)
    @contents = policy_scope(Content)
                  .where(external_provider: provider, file_type: file_type)
                  .order(coef_total: :desc)
                  .limit(4)
  end
end
