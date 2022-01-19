class WelcomeController < ApplicationController

  def index
render layout: 'applicationaccueil'
  end
def contact
end
def mediatheque
@categories=Category.all
end
def cercle_mess_du_rsma_guyane
end
def accompagnezlaction
end
def documents_a_fournir
end
def pam2021
end
end
