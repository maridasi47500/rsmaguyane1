require 'nokogiri'
require 'open-uri'
@array=[
"https://www.rsmaguyane.fr/",
"https://www.rsmaguyane.fr/rsma-guyane/implantation.html",
"https://www.rsmaguyane.fr/rsma-guyane/les-compagnies.html",
"https://www.rsmaguyane.fr/nos-formations/le-deroulement-des-formations.html",
"https://www.rsmaguyane.fr/nos-formations/les-filieres-de-formation.html",
"https://www.rsmaguyane.fr/nos-formations/la-remise-a-niveau-scolaire.html",
"https://www.rsmaguyane.fr/nos-formations/recrutement-2020.html",
"https://www.rsmaguyane.fr/espace-entreprise.html",
"https://www.rsmaguyane.fr/espace-entreprise/newsletter-entreprises.html"
]
@array.each do |url|
@doc=Nokogiri::HTML(URI.open(url))
@doc.css('img').each do |img|
`(cd ./app/assets/images && wget "https://www.rsmaguyane.fr#{img.attributes['src'].value}")`
end
end
