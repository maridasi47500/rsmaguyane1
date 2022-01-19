class RsmaGuyaneController < ApplicationController
protect_from_forgery excpt: [:rsma_guyane]
def le_regiment
end
def les_compagnies
end
def rsma_guyane
params[:limit]||=25
@articles1=Article.allby1(params[:filter_order],params[:limit],params[:page])
if !@articles1[params[:page].to_i]
params[:page]=nil
end
@articles=Article.allby(params[:filter_order],params[:limit],params[:page])
end
end
