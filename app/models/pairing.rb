class Pairing < ApplicationRecord
  belongs_to :tournament

  has_many :games, dependent: :destroy

  validates_presence_of :name, on: :update

  # Seleccionar los equipos a emparejar
  def select_teams
    team_ids = []

    if tournament.pairings.empty?
      tournament.teams.each do |team|
        team_ids << team.id
      end
    else
      tournament.pairings.each do |pairing|
        unless pairing.round_finished
          pairing.games.each do |game|
            game.winner_teams.each do |team|
              team_ids << team.id
            end
          end
          pairing.update_attribute(:round_finished, true)
        end
      end
    end

    team_ids
  end

  # Emparejamiento de equipos
  def match
    shuffled_team_ids = select_teams.shuffle
    total_teams = shuffled_team_ids.count

    if total_teams % 2 == 0
      even = true
    else
      even = false
    end

    for i in 1..(total_teams / 2)
      shuffled_team_ids -= pair = shuffled_team_ids.take(2)
      games.new(team_ids: [pair[0], pair[1]])
    end

    unless even
      games.new(winner_team_ids: [shuffled_team_ids.first])
    end
  end
end
