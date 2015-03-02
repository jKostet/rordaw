# b1 = Brewery.create name:"Koff", year:1897
# b2 = Brewery.create name:"Malmgard", year:2001
# b3 = Brewery.create name:"Weihenstephaner", year:1042
# l = Style.create(name:"Lager", description:"lager desc")
#
# b1.beers.create name:"Iso 3", style:l
# b1.beers.create name:"Karhu", style:l
# b1.beers.create name:"Tuplahumala", style:l
# b2.beers.create name:"Huvila Pale Ale", style:l
# b2.beers.create name:"X Porter", style:l
# b3.beers.create name:"Hefezeizen", style:l
# b3.beers.create name:"Helles", style:l

# users = 100           # jos koneesi on hidas, riittää esim 100
# breweries = 50       # jos koneesi on hidas, riittää esim 50
# beers_in_brewery = 20
# ratings_per_user = 15
#
# (1..users).each do |i|
#   User.create! username:"user_#{i}", password:"Passwd1", password_confirmation:"Passwd1"
# end
#
# (1..breweries).each do |i|
#   Brewery.create! name:"Brewery_#{i}", year:1900, active:true
# end
#
# bulk = Style.create! name:"bulk", description:"cheap, not much taste"
#
# Brewery.all.each do |b|
#   n = rand(beers_in_brewery)
#   (1..n).each do |i|
#     beer = Beer.create! name:"beer #{b.id} -- #{i}", style:bulk
#     b.beers << beer
#   end
# end
#
# User.all.each do |u|
#   n = rand(ratings_per_user)
#   beers = Beer.all.shuffle
#   (1..n).each do |i|
#     r = Rating.new score:(1+rand(50))
#     beers[i].ratings << r
#     u.ratings << r
#   end
# end

Style.create name:"Pale Ale", description:"PA desc"
Style.create name:"IPA", description:"IPA desc"
Style.create name:"Weizen", description:"Weizen desc"
Style.create name:"Porter", description:"Porter desc"
Style.create name:"Petrol", description:"Petrol desc"