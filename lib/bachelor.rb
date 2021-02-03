require 'pry'
require 'json'

file = File.read('./spec/fixtures/contestants.json')
data = JSON.parse(file)

def get_contestants(data)
  contestants = []
  data.each do |season, people|
    people.each do |person|
      contestants.push(person)
    end
  end
  contestants
end

def get_first_name_of_season_winner(data, season)
  # code here
  contestants = data[season]
  she_wins = contestants.filter do |person|
    person["status"] == "Winner"
  end
  she_wins[0]["name"].split[0]
end

def get_contestant_name(data, occupation)
  # code here
  contestants = get_contestants(data)
  contestants.each do |person|
    if person["occupation"] == occupation
      return person["name"]
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  # code here
  contestants = get_contestants(data)
  contestants_from_there = contestants.filter do |person|
    person["hometown"] == hometown
  end
  contestants_from_there.length
end

def get_occupation(data, hometown)
  # code here
  contestants = get_contestants(data)
  contestant = contestants.find do |person|
    person["hometown"] == hometown
  end
  contestant["occupation"]
end

def get_average_age_for_season(data, season)
  # code here
  contestants = data[season]
  ages = []
  contestants.each do |person|
    ages.push(person["age"].to_f)
  end
  avg_age = (ages.reduce(:+)/ages.length).round
end
