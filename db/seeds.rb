b1 = Brewery.create name:"Koff", year:1897
b2 = Brewery.create name:"Malmgard", year:2001
b3 = Brewery.create name:"Weihenstephaner", year:1042
l = Style.create(name:"Lager", description:"lager desc")

b1.beers.create name:"Iso 3", style:l
b1.beers.create name:"Karhu", style:l
b1.beers.create name:"Tuplahumala", style:l
b2.beers.create name:"Huvila Pale Ale", style:l
b2.beers.create name:"X Porter", style:l
b3.beers.create name:"Hefezeizen", style:l
b3.beers.create name:"Helles", style:l