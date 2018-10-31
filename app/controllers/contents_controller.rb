class ContentsController < ApplicationController
  def update
  end

  def index
    @contents = policy_scope(Content)
    # type: image like post
    if params[:file_type]
      @content = spot("facebook", params[:file_type])
    else
      @facebook_images = spot("facebook", "image", 4)
      @facebook_posts = spot("facebook", "post", 4)
      @facebook_likes = spot("facebook","like", 4)
    end
  end

  def spot(provider, file_type, number = nil)
    if number == nil
      @contents = policy_scope(Content)
                  .where(external_provider: provider, file_type: file_type)
                  .order(coef_total: :desc)
    else
      @contents = policy_scope(Content)
                    .where(external_provider: provider, file_type: file_type)
                    .order(coef_total: :desc)
                    .limit(number.to_i)
    end
  end
end
