class ContentsController < ApplicationController
    skip_after_action :verify_authorized, only: [:twitter_delete]

  def index
    conditions = {scan_date: Date.today}
    conditions[:external_provider] = params[:external_provider] if params[:external_provider].present?
    conditions[:file_type] = params[:file_type] if params[:file_type].present?

    @contents = policy_scope(Content.where(conditions).order(coef_total: :desc))
    @contents_file_type =["image", "post", "like"]

    if params[:external_provider]
      @contents_provider = [params[:external_provider]]
    elsif current_user.facebook.nil?
      @contents_provider =["twitter"]
    elsif current_user.twitter.nil?
      @contents_provider = ["facebook"]
    else
      @contents_provider =["facebook", "twitter"]
    end

    @selection = policy_scope(Content.where(selected: true, scan_date: Date.today))
  end

  def update
    @content = Content.find(params[:id])
    authorize @content
    if @content.update(selected: params_detail[:selected] == "0")
      @compteur = Content.where(selected: true).size
      respond_to do |format|
        format.js
      end
    else
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

  def twitter_delete
    TwitterDelete.new(current_user).delete
    redirect_to '/contents?selected=true'
  end

  private

  def params_detail
    params.require(:content).permit(:selected)
  end
end
