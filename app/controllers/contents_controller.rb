class ContentsController < ApplicationController

  def index
    conditions = {}
    conditions[:external_provider] = params[:external_provider] if params[:external_provider].present?
    conditions[:file_type] = params[:file_type] if params[:file_type].present?

    @contents = policy_scope(Content.where(conditions).order(coef_total: :desc))
    @contents_file_type =["image", "post", "like"]

    if params[:external_provider]
    @contents_provider = [params[:external_provider]]
    else
    @contents_provider =["facebook", "twitter"]
    end

    @selection = policy_scope(Content.where(selected: true))
  end

  def update
    @content = Content.find(params[:id])
    authorize @content


    if @content.update(selected: params_detail[:selected] == "0")
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

  private

  def params_detail
    params.require(:content).permit(:selected)
  end
end
