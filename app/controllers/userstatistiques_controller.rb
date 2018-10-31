class UserstatistiquesController < ApplicationController
  def index
    @userstatistiques = policy_scope(Userstatistique)
  end

  def show
    @userstatistique = Userstatistique.find(params[:id])
    authorize @userstatistique
  end
end
