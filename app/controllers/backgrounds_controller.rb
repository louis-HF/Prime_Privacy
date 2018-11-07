class BackgroundsController < ApplicationController
  skip_after_action :verify_authorized, only: :loadingpage
  def loadingpage
    PreferenceInitializer.new(current_user).create_pref if Preference.where(user: current_user).empty?
    if Content.where(user: current_user, scan_date: Date.today).empty?
      FacebookJob.perform_later(current_user.id)
    end
  end
end
