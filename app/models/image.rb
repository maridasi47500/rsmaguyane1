class Image < ApplicationRecord
has_many :ratings
has_many :members, through: :ratings
belongs_to :member
belongs_to :category
def addhit
j=read_attribute(:hits).to_i
write_attribute(:hits, (j+1))
save

end

def mytitle(q)
if date && title
date.year.to_s+'-'+title
else
q.to_i + 1
end
end
def suiv
myids= category.image_ids
if myids.length > 1 && myids[-1] != self.id
ind=myids.index(self.id) + 1
Image.find(myids[ind])
else
nil
end
end
def prec
myids= category.image_ids
if myids.length > 1 && myids[0] != self.id
ind=myids.index(self.id) - 1
Image.find(myids[ind])
else
nil
end
end
def image=(file)
    if file.is_a?(String)
    self.write_attribute(:image,file)
  else

      pathfile = file.tempfile.path
    filename =file.original_filename
      loc='photos'
abs="/app/assets/images/"+filename
p abs
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
write_attribute(:image,file.original_filename)

    end
end
def image
read_attribute(:image)
end

end
