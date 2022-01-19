class Category < ApplicationRecord
belongs_to :member
has_many :images
accepts_nested_attributes_for :images
#["1","Nr. image croissant"],
#["2","Nr. image d&eacute;croissant"],
#["3","Titre croissant"],
#["4","Titre d&eacute;croissant"],
#["5","Date croissante"],
#["6","Date d&eacute;croissante"],
#["11","Nb &eacute;valuations croissant"],
#["12","Nb &eacute;valuations d&eacute;croissant"],
#["13","Evaluation croissante"],
#["14","Evaluation d&eacute;croissante"],
#["15","Hits croissants"],
#["16","Hits d&eacute;croissants"]].to_h.invert.to_a, param
def allby1(filterorder,limit=nil,page=nil)
j=images
p filterorder
case filterorder
when '1'
j=j.order('images.id' => :asc)
when '2'
j=j.order('images.id' => :desc)
p "imagesdecroissant"
when '3'
j=j.order('images.title' => :asc)
when '4'
j=j.order('images.title' => :desc)
when '5'
j=j.order('images.date' => :asc)
when '6'
j=j.order('images.date' => :desc)
when '11'
j=j.joins('left join ratings r on r.image_id = images.id').select('r.*, images.*,r.id as myrating,count(r.id) as countratings').group('images.id').order('countratings' => :asc)


when '12'
j=j.joins('left join ratings r on r.image_id = images.id').select('r.*, images.*,r.id as myrating, count(r.id) as countratings').group('images.id').order('countratings' => :desc)

when '13'
j=j.joins('left join ratings r on r.image_id = images.id').select('r.*,r.rating as yourrating, images.*').group('images.id').order('yourrating' => :asc)

when '14'
j=j.joins('left join ratings r on r.image_id = images.id').select('r.*,r.rating as yourrating, images.*').group('images.id').order('yourrating' => :desc)
when '13'
j=j.order('images.hits' => :asc)
when '14'
j=j.order('images.hits' => :desc)
else
j=j
end
p j
case limit 
when "0"
[j]
else
j.each_slice(limit.to_i).to_a
end


end
def allby(filterorder,limit=nil,page=nil)
self.allby1(filterorder,limit,page)[page.to_i]

end

end
