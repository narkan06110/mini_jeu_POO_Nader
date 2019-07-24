require_relative 'player.rb'
#permet de lier les fichiers game et player pôur utiliser les classes et méthodes qu'ils contiennent


@@all_enemies = []

class Game
	attr_accessor :human_player, :enemies

	def initialize(title)
		player1 = Player.new("Yvon") 
		player2 = Player.new("José") 
		player3 = Player.new("Jean") 
		player4 = Player.new("Marie") #on initialise quatres instances de la classe Player
		@@all_enemies << self #on les met dans un array
		@human_player = HumanPlayer.new("#{title}")
	end 

	def self.kill_player(player_killed)
		@@all_enemies.delete(@@all_enemies.index(player_killed.name)) #supprime l'ennemi choisi de la liste des ennemis, cela ne fonctionne pas
	end 

	def is_still_ongoing 
		if @human_player.life_point > 0 && @enemies != nil 
		#vérifie si le jeu est toujours en cours (le joueur a toujours des Pv et tous les ennemis ne sont pas morts)
			return true 
		else return false
		end
	end 

end 