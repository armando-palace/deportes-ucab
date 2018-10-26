class Pairing < ApplicationRecord
  belongs_to :tournament

  has_many :games, dependent: :destroy

  # Barajar equipos
  def shuffle_teams
    team_ids = []

    tournament.teams.each do |team|
      team_ids << team.id
    end

    team_ids.shuffle!
  end

  # Emparejamiento de equipos
  def match
    shuffled_team_ids = shuffle_teams
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
