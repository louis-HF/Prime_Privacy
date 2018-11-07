class PreferencesController < ApplicationController
  before_action :set_preference, only: [:destroy]

  def index
    @preferences = policy_scope(Preference)
    @preferences = Preference.order(:rank).all
  end

  def destroy
    @preference.destroy
  end

  private

  def preference_params
     params.require(:article).permit(:rank)
  end

  def set_preference
    @preference = Preference.find(params[:id])
    authorize @preference
  end
end
