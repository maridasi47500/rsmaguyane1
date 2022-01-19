m=Member.first
1000.times do

Article.create!(member:m,title: "Guyanaise", content: "je suis en guyane")
end
