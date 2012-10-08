class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def is_a_game(element)

  if element.kind_of?(Array)
    if element.length == 2
        if !(element[0].kind_of?(Array) and element[1].kind_of?(Array))
          return false
        else
          if element[0][0].kind_of? String and element[1][1].kind_of? String
            return true
          else
            return false
          end
        end 
    end 
  end

  return false
end

def rps_result(m1, m2)
    new_match = Array.new

    new_match.push rps_game_winner m1
    new_match.push rps_game_winner m2

    return new_match

end

def rps_game_winner(game)

  moves = {"S" => "P","P" => "R","R" => "S"}

  raise WrongNumberOfPlayersError unless game.length == 2

  game.each do|play|
    raise NoSuchStrategyError unless moves.has_key?(play[1])
  end

  if moves[game[0][1].upcase] == game[1][1].upcase
    return game[0]
  elsif moves[game[1][1].upcase] == game[0][1].upcase
    return game[1]
  else
    return game[0]
  end

end

def rps_tournament_winner(tournament)

  winners = Array.new
  couple = Array.new

  if is_a_game(tournament)
      return rps_game_winner tournament
  else

    tournament.each_with_index { |game,index| 

      if is_a_game(game)

        couple.push rps_game_winner game

      else
        couple.push rps_tournament_winner game
      end 

      if (index+1)%2 == 0
        winners.push couple.dup
        couple.clear
      end

    }
  end

  if couple.length == 1
    return couple[0]
  else
    return rps_tournament_winner winners
  end

end

# tournament = [[    [
#         [ ["Armando1", "P"], ["Dave1", "S"] ],
#         [ ["Richard1", "R"],  ["Michael1", "S"] ],
#     ],
#     [
#         [ ["Allen1", "S"], ["Omer1", "P"] ],
#         [ ["David E1.", "R"], ["Richard X1.", "P"] ]
#     ]],

#     [    [
#         [ ["Armando2", "P"], ["Dave2", "S"] ],
#         [ ["Richard2", "R"],  ["Michael2", "S"] ],
#     ],
#     [
#         [ ["Allen2", "S"], ["Omer2", "P"] ],
#         [ ["David E2.", "R"], ["Richard X2.", "P"] ]
#     ]]

# ]

# tournament = [ ["Armando", "P"], ["Dave", "S"] ]

tournament = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]

puts (rps_tournament_winner tournament).to_s