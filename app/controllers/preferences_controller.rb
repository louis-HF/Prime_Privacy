class PreferencesController < ApplicationController

  def index
    @preferences = policy_scope(Preference)
    @preferences = Preference.order(:rank).all
  end

  def update
  end

  private

  def prefence_params
     params.require(:article).permit(:rank)
  end
end
