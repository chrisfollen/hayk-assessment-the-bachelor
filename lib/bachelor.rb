require 'pry'
require 'json'

file = File.read('./spec/fixtures/contestants.json')
data = JSON.parse(file)

# def get_all_contestants(data)
#   contestants = []
#   data.each do |season, people|
#     people.each do |person|
#       contestants.push(person)
#     end
#   end
# contestants
# end

def get_all_contestants(data)
  vals = data.values.flatten
end

def get_first_name_of_season_winner(data, season)
  contestants = data[season]
  she_wins = contestants.filter {|person| person["status"] == "Winner"} 
  she_wins[0]["name"].split[0]
end

def get_contestant_name(data, occupation)
  get_all_contestants(data).each do |person|
    if person["occupation"] == occupation
      return person["name"]
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  get_all_contestants(data).filter {|person| person["hometown"] == hometown}.length
end

def get_occupation(data, hometown)
  contestant = get_all_contestants(data).find {|person| person["hometown"] == hometown}
  contestant["occupation"]
end

def get_average_age_for_season(data, season)
  contestants = data[season]
  ages = contestants.map {|person| person["age"].to_f}
  avg_age = (ages.reduce(:+)/ages.length).round
end
