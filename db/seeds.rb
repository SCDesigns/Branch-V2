#Seed file to populate Branch feed. Seed with 'rake db:seed'

def make_seeds
  make_cities
  make_categories
  make_users
  make_branches
  make_comments
end

def make_cities
  ['New York','Chicago','Los Angeles'].each do |name|
    City.create(name: name)
  end
end

def make_categories
  ['Music','Sports','Theatre','Tourism'].each do |name|
    Category.create(name: name)
  end
end

def make_users
  #Venues
    msg = User.create(username: "MSG", password: "4penn", email: "events@msg.com")
    apollo = User.create(username: "Apollo", password: "showtime", email: "events@theapollo.com")
    united = User.create(username: "United", password: "overbooked", email: "events@unitedcenter.com")
    blues = User.create(username: "HouseOfBlues", password: "bbking", email: "events@hob.com")
    hollywood = User.create(username: "HollywoodBowl", password: "notcereal", email: "events@thebowl.com")
  #Users
    kyle = User.create(username: "DefinitelyKyle", password: "shredthegnar", email: "totallykyle@gmail.com")
    rachel = User.create(username: "OkayyRach", password: "yayitsrach", email: "rachelg@aol.com")
end

def make_branches
##########
# Seed 1 #
##########
  msg.branches << Branch.create(
    event: "New York Rangers vs. Montreal Canadiens - Game 6",
    organization: "NHL",
    date: "Saturday, April 22nd, 12:00 AM",
    location: "Madison Sqaure Garden - 4 Pennsylvania Plaza, New York, NY 10001",
    info: "For Tickets & Game Times Visit - http://madisonsquaregarden.ticketoffices.com/New+York+Rangers",
    city_id: 1,
    category_id: 2)
  msg.branches << Branch.create(
    event: "New York Rangers vs. Montreal Canadiens - Game 7 (If Necessary)",
    organization: "NHL",
    date: "Sunday, April 23nd, 12:00 AM",
    location: "Madison Sqaure Garden - 4 Pennsylvania Plaza, New York, NY 10001",
    info: "For Tickets & Game Times Visit - http://madisonsquaregarden.ticketoffices.com/New+York+Rangers",
    city_id: 1,
    category_id: 2)
  msg.branches << Branch.create(
    event: "The All Access Tour",
    organization: "MSG",
    date: "All Non-Event Days - See Info",
    location: "Madison Sqaure Garden - 4 Pennsylvania Plaza, New York, NY 10001",
    info: "Call 212.465.6741 or Visit http://www.thegarden.com/calendar",
    city_id: 1,
    category_id: 4)
  msg.save

  ##########
  # Seed 2 #
  ##########
  apollo.branches << Branch.create(
    event: "Urban Word NYC Teen Poetry Grand Slam Final",
    organization: "Apollo Theatre Foundation",
    date: "Saturday, April 22nd, 6:00 PM",
    location: "Apollo Theatre - 253 W 125th St, New York, NY 10027",
    info: "For Tickets & More Info - https://www.apollotheater.org/calendar/",
    city_id: 1,
    category_id: 3)
  apollo.branches << Branch.create(
    event: "Salon Series: Maurice Chestnut & Friends",
    organization: "Apollo Theatre Foundation",
    date: "Friday, April 21nd, 7:30 PM",
    location: "Apollo Theatre - 253 W 125th St, New York, NY 10027",
    info: "For Tickets & More Info - https://www.apollotheater.org/calendar/",
    city_id: 1,
    category_id: 3)
  apollo.save

  ##########
  # Seed 3 #
  ##########
  united.branches << Branch.create(
    event: "Chicago Blackhawks vs. Nashville Predators - Game 4",
    organization: "United Center",
    date: "Thursday, April 20th, 8:00 PM",
    location: "United Center - 1901 W Madison St, Chicago, IL 60612",
    info: "For Tickets & More Info - http://www.unitedcenter.com/",
    city_id: 2,
    category_id: 2)
  united.branches << Branch.create(
    event: "Chicago Bulls vs. Boston Celtics - Game 3",
    organization: "United Center",
    date: "Friday, April 21st, 7:00 PM",
    location: "Apollo Theatre - 253 W 125th St, New York, NY 10027",
    info: "For Tickets & More Info - http://www.unitedcenter.com/",
    city_id: 2,
    category_id: 2)
  united.save

  ##########
  # Seed 4 #
  ##########
  blues.branches << Branch.create(
    event: "Monster Energy Outbreak Presents: 21 Savage ‑ Issa Tour",
    organization: "House of Blues Chicago",
    date: "Thursday, April 20, 5:30 PM",
    location: "329 N Dearborn St, Chicago, IL 60654",
    info: "For Tickets & Schedule - http://www.ticketmaster.com/House-of-Blues-Chicago-tickets-Chicago/venue/32905",
    city_id: 2,
    category_id: 1)
  blues.save

  ##########
  # Seed 5 #
  ##########
  hollywood.branches << Branch.create(
    event: "Lionel Richie: All The Hits With Very Special Guest Mariah Carey",
    organization: "Hollywood Bowl",
    date: "Friday, May 5, 7:00 PM",
    location: "2301 Highland Avenue, Los Angeles, CA",
    info: "For Tickets & Schedule - http://www.livenation.com/venues/14273/hollywood-bowl",
    city_id: 3,
    category_id: 1)
  hollywood.save
end

def make_comments
# :branch_id, :user_id, :title, :content
  Comment.create(
    branch_id: 9,
    user_id: 7,
    title: "Can't Wait!!",
    content: "Been meaning to see Lionel live, but what's Mariah Carey gonna sing? Like Christmas songs...???")
  Comment.create(
    branch_id: 8,
    user_id: 5,
    title: "Will 22 Savage also be there?",
    content: "I heard he's not as good but I think they should collab.")
end

make_seeds
