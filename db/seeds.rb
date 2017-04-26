#Seed file to populate Branch feed. Seed with 'rake db:seed'

def make_seeds
  make_cities
  make_users
  make_branches
  make_comments
end

def make_cities
  cities = ['New York','Chicago','Los Angeles'].each do |name|
    City.create(name: name, categories: ['Music','Sports','Theatre','Tourism'])
  end
end

def make_users
  #Admin
    User.create(name: "admin", password: "asecret", email: "admin@branch.com", role: 1)
  #Venues
    User.create(name: "MSG", password: "4penn", email: "events@msg.com")
    User.create(name: "Apollo", password: "showtime", email: "events@theapollo.com")
    User.create(name: "United", password: "overbooked", email: "events@unitedcenter.com")
    User.create(name: "HouseOfBlues", password: "bbking", email: "events@hob.com")
    User.create(name: "HollywoodBowl", password: "notcereal", email: "events@thebowl.com")
  #Users
    User.create(name: "DefinitelyKyle", password: "shredthegnar", email: "totallykyle@gmail.com")
    User.create(name: "OkayyRach", password: "yayitsrach", email: "rachelg@aol.com")
end

def make_branches
##########
# Seed 1 #
##########
  Branch.create(
    name: "New York Rangers vs. Montreal Canadiens - Game 6",
    organization: "NHL",
    date: "Saturday, April 22nd, 12:00 AM",
    location: "Madison Sqaure Garden - 4 Pennsylvania Plaza, New York, NY 10001",
    info: "For Tickets & Game Times Visit - http://madisonsquaregarden.ticketoffices.com/New+York+Rangers",
    user: User.find_by(id: 2),
    city_id: City.find_by(id: 1).id,
    category_id: Category.find_by(id: 2).id)
  Branch.create(
    name: "New York Rangers vs. Montreal Canadiens - Game 7 (If Necessary)",
    organization: "NHL",
    date: "Sunday, April 23nd, 12:00 AM",
    location: "Madison Sqaure Garden - 4 Pennsylvania Plaza, New York, NY 10001",
    info: "For Tickets & Game Times Visit - http://madisonsquaregarden.ticketoffices.com/New+York+Rangers",
    user: User.find_by(id: 2),
    city_id: City.find_by(id: 1).id,
    category_id: Category.find_by(id: 2).id)
  Branch.create(
    name: "The All Access Tour",
    organization: "MSG",
    date: "All Non-Event Days - See Info",
    location: "Madison Sqaure Garden - 4 Pennsylvania Plaza, New York, NY 10001",
    info: "Call 212.465.6741 or Visit http://www.thegarden.com/calendar",
    user: User.find_by(id: 2),
    city_id: City.find_by(id: 1).id,
    category_id: Category.find_by(id: 4).id)

  ##########
  # Seed 2 #
  ##########
  Branch.create(
    name: "Urban Word NYC Teen Poetry Grand Slam Final",
    organization: "Apollo Theatre Foundation",
    date: "Saturday, April 22nd, 6:00 PM",
    location: "Apollo Theatre - 253 W 125th St, New York, NY 10027",
    info: "For Tickets & More Info - https://www.apollotheater.org/calendar/",
    user: User.find_by(id: 2),
    city_id: City.find_by(id: 1).id,
    category_id: Category.find_by(id: 3).id)
  Branch.create(
    name: "Salon Series: Maurice Chestnut & Friends",
    organization: "Apollo Theatre Foundation",
    date: "Friday, April 21nd, 7:30 PM",
    location: "Apollo Theatre - 253 W 125th St, New York, NY 10027",
    info: "For Tickets & More Info - https://www.apollotheater.org/calendar/",
    user: User.find_by(id: 2),
    city_id: City.find_by(id: 1).id,
    category_id: Category.find_by(id: 3).id)

  ##########
  # Seed 3 #
  ##########
  Branch.create(
    name: "Chicago Blackhawks vs. Nashville Predators - Game 4",
    organization: "United Center",
    date: "Thursday, April 20th, 8:00 PM",
    location: "United Center - 1901 W Madison St, Chicago, IL 60612",
    info: "For Tickets & More Info - http://www.unitedcenter.com/",
    user: User.find_by(id: 3),
    city_id: City.find_by(id: 2).id,
    category_id: Category.find_by(id: 2).id)
  Branch.create(
    name: "Chicago Bulls vs. Boston Celtics - Game 3",
    organization: "United Center",
    date: "Friday, April 21st, 7:00 PM",
    location: "Apollo Theatre - 253 W 125th St, New York, NY 10027",
    info: "For Tickets & More Info - http://www.unitedcenter.com/",
    user: User.find_by(id: 3),
    city_id: City.find_by(id: 2).id,
    category_id: Category.find_by(id: 2).id)

  ##########
  # Seed 4 #
  ##########
  Branch.create(
    name: "Monster Energy Outbreak Presents: 21 Savage ‑ Issa Tour",
    organization: "House of Blues Chicago",
    date: "Thursday, April 20, 5:30 PM",
    location: "329 N Dearborn St, Chicago, IL 60654",
    info: "For Tickets & Schedule - http://www.ticketmaster.com/House-of-Blues-Chicago-tickets-Chicago/venue/32905",
    user: User.find_by(id: 4),
    city_id: City.find_by(id: 2).id,
    category_id: Category.find_by(id: 1).id)

  ##########
  # Seed 5 #
  ##########
  Branch.create(
    name: "Lionel Richie: All The Hits With Very Special Guest Mariah Carey",
    organization: "Hollywood Bowl",
    date: "Friday, May 5, 7:00 PM",
    location: "2301 Highland Avenue, Los Angeles, CA",
    info: "For Tickets & Schedule - http://www.livenation.com/venues/14273/hollywood-bowl",
    user: User.find_by(id: 5),
    city_id: City.find_by(id: 3).id,
    category_id: Category.find_by(id: 1).id)

end

def make_comments
# :branch.find_by(id:, :user: User.find_by(id:, :title, :content
  Comment.create(
    branch_id: Branch.find_by(id: 4).id,
    user: User.find_by(id: 7),
    title: "Can't Wait!!",
    content: "Been meaning to see Lionel live, but what's Mariah Carey gonna sing? Like Christmas songs...???")
  Comment.create(
    branch_id: Branch.find_by(id: 4).id,
    user: User.find_by(id: 7),
    title: "Will 22 Savage also be there?",
    content: "I heard he's not as good but I think they should collab.")
end

make_seeds
