class PreferencesController < ApplicationController

  def index
    @preferences = policy_scope(Preference)
  end

  def update
  end

end
