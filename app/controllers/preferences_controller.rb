class PreferencesController < ApplicationController

  def index
    @preferences = policy_scope(Preference)
  end

  def update
    @preference = Preference.find(params[:id])
    @preference.update(prefence_params)
  end

  private

  def prefence_params
     params.require(:article).permit(:rank)
  end
end
