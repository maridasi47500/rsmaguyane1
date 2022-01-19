class Article < ApplicationRecord
belongs_to :member
def addhit
j=read_attribute(:hits).to_i
write_attribute(:hits, (j+1))
save

end
def bynewline
self.content.split("\r\n").select{|x|x != ''}
end
def self.allby1(filterorder,limit=nil,page=nil)
j=all
case filterorder
when 'author'
j=j.joins('left join members on articles.member_id = member.id').order('members.login' => :asc)
when 'clics'
j=j.order(hits: :asc)
when 'titre'
j=j.order(title: :asc)
else
j=j
end
j.each_slice(limit.to_i).to_a || []
rescue 
[]

end
def self.allby(filterorder,limit=nil,page=nil)
self.allby1(filterorder,limit,page)[page.to_i]

end
end

