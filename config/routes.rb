class Mymethod
def self.mycontroller(t)
p t
h=t.gsub('/',' ').gsub('.html',' ').gsub('.',' ').squish.strip.split(' ')
[h[0], h[-1]].map{|x|I18n.transliterate(x).underscore}.join('#')
end
def self.getroute(u,i = {})

t=I18n.t(*[u,i])
p t
if t && t !={} && t!='/' && t!=''
Rails.application.routes.draw do

begin
get t, to: Mymethod.mycontroller(t)
rescue
begin
get t, to: Mymethod.other(t)
rescue
end
end
end
end

end
def self.other(t)
p t
I18n.transliterate(t).gsub("/","").underscore+"#index"
end

end
Rails.application.routes.draw do
get "/mediatheque/:idcat-:titlecat/detail/:idimg-:titleimg.html", to: "images#show", as: :voirimage, :constraints => { :idimg => /[0-9]+(\[0-9][0-9]+)*/,:idcat => /[0-9]+(\[0-9][0-9]+)*/ }
post "/mediatheque/category/:idcat-:titlecat.html", to: "categories#show", as: :voircat, :constraints => { :idcat => /[0-9]+(\[0-9][0-9]+)*/}
get "/mediatheque/category/:idcat-:titlecat.html", to: "categories#show", as: :voiralbum, :constraints => { :idcat => /[0-9]+(\[0-9][0-9]+)*/}
get "/mediatheque/category/:idcat-:titlecat.feed", to: "categories#show", as: :voiralbumfeed, :constraints => { :idcat => /[0-9]+(\[0-9][0-9]+)*/}
resources :images do
member do
get 'eval'
end
end
resources :categories do
collection do
get 'images'

end
end
post "/rsma-guyane.html", to: "rsma_guyane#rsma_guyane"
post 'connexion', to: 'members/sessions#create'
resources :articles
root to: 'welcome#index'
  get 'welcome/index'

get "/mon-compte.html", to: "members/registrations#new", view: 'signup', as: :inscriptionlien
post "/nos-formations.html", to: "members/registrations#create", inscription: true, as: :inscriptionexpress

devise_for :members, controllers: { registrations: 'members/registrations', sessions: 'members/sessions' }

get "/plan-du-site.html", to: "welcome#plandusite"
get "/la-reserve-au-rsma-guyane.html",to:"welcome#la_reserve_au_rsma"
get "/documents-a-fournir.html", to:"welcome#documents_a_fournir"
get "/accompagnez-l-action-du-rsma-guyane.html", to: "welcome#accompagnezlaction"
get "/cercle-mess-du-rsma-guyane.html", to: "welcome#cercle_mess_du_rsma_guyane"
get "/mediatheque.html", to: "welcome#mediatheque"
get "/contact.html", to: "welcome#contact"
  get 'nos_formations/nos_formations'
get "/pam-2021.html", to: 'welcome#pam2021'


  get 'nos_formations/nos_formations'
(3..7).to_a.each do |f|
if I18n.t("menu.#{f}.1", default: "00") != "00"
Mymethod.getroute("menu.title.#{f}.1",default: "")
(1..8).to_a.each do |g|


if I18n.t("menu.#{f}.#{g+1}.1", default: "00") != "00" && I18n.t("menu.#{f}.#{g}text", default: "00") != "00"
#Mymethod.getroute("menu.title.#{f}.#{g}",default: "")

(1..8).to_a.each do |h|
if I18n.t("menu.#{f}.#{g+1}.#{h}", default: "00") != "00"
Mymethod.getroute("menu.#{f}.#{g+1}.#{h}",default: "")


end
end
elsif I18n.t("menu.#{f}.#{g}text", default: "00") != "00"

Mymethod.getroute("menu.#{f}.#{g}",default: "")


end
end




else
        Mymethod.getroute("menu.#{f}.1")
end
end
get "/rsma-guyane/:id-:title", show: true, to: "articles#show", as: :rsmaguyanearticleshow, :constraints => { :id => /[0-9]+(\[0-9][0-9]+)*/ }


  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
