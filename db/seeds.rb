# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'httparty'
require 'date'

Character.destroy_all
Player.destroy_all
CampaignMonster.destroy_all
Monster.destroy_all
Campaign.destroy_all

NUMBER_OF_PLAYERS = 12
NUMBER_OF_CHARACTERS = 2
NUMBER_OF_MONSTERS = 60
NUMBER_OF_CAMPAIGNS = 8
MONSTERS_PER_CAMPAIGN = 15

races = HTTParty.get('http://dnd5eapi.co/api/races/').parsed_response
classes = HTTParty.get('http://dnd5eapi.co/api/classes/').parsed_response
monsters = HTTParty.get('http://dnd5eapi.co/api/monsters/').parsed_response

NUMBER_OF_MONSTERS.times do
  name = monsters['results'][rand(0..monsters['count'] - 1)]['name']
  level = rand(1..3)
  health = rand(2..12)
  damage = rand(1..6)

  Monster.create(name: name, level: level,
                 health: health, damage: damage)
end

NUMBER_OF_CAMPAIGNS.times do
  name = Faker::Games::ElderScrolls.unique.region
  start_date = Time.now

  campaign = Campaign.create(Name: name, Start_Date: start_date)

  MONSTERS_PER_CAMPAIGN.times do
    CampaignMonster.create(campaign: campaign, monster: Monster.order('RANDOM()').first)
  end
end

NUMBER_OF_PLAYERS.times do
  player_name = Faker::Name.unique.name
  registration_date = Time.now

  player = Player.create(name: player_name, registration_date: registration_date)

  NUMBER_OF_CHARACTERS.times do
    race = races['results'][rand(0..races['count'] - 1)]['name']
    clas = classes['results'][rand(0..classes['count'] - 1)]['name']
    first_name = Faker::Name.unique.first_name
    last_name = Faker::Name.unique.last_name
    level = rand(1..3)
    health = HTTParty.get('http://roll.diceapi.com/json/d20').parsed_response['dice'][0]['value']
    damage = HTTParty.get('http://roll.diceapi.com/json/d6').parsed_response['dice'][0]['value']

    character = Character.create(first_name: first_name, last_name: last_name,
                                 character_class: clas, race: race, level: level,
                                 health: health, damage: damage, campaign_id: Campaign.order('RANDOM()').first.id,
                                 player_id: player.id)
  end
end

puts "Created #{Player.count} Players."
puts "Created #{Character.count} Characters."
puts "Created #{Campaign.count} Campaigns."
puts "Created #{Monster.count} Monsters."
puts "Created #{CampaignMonster.count} Campaign Monsters."
