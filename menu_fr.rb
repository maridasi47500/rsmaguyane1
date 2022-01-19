require 'nokogiri'
require 'open-uri'
require 'yaml'


@doc = Nokogiri::HTML(URI.open('https://www.rsmaguyane.fr/cercle-mess-du-rsma-guyane.html'))
@menu=@doc.css('.menu')
@file={}

def goinsidemenu(u,file,file2)

u.children.each_with_index do |v,l|

k=l+1
file2[k]||={}
#@file[i][j][k] = {}
p v.name


   if v.name == "a"

file2[k]=v.attributes['href'].value
file2["#{k}text"]=v.text
   elsif v.name == "ul"
file[k]||={}
goinsidemenu(v,file,file2[k])
   elsif v.name == "li"

file[k]||={}
if v.children.select{|x|x.name=='ul'}.length > 0

goinsidemenu(v,file[k],file2[k])
else
file["#{k}text"] = v.text
file[k] = v.css('a')[0].attributes['href'].value
end

   end

end
end
@file['title']={}
goinsidemenu(@menu[0], @file,@file['title'])

p @file

File.write('./config/locales/fr.yml', YAML.dump({"fr"=> {"menu"=> @file}}))

