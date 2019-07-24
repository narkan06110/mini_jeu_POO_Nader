require 'bundler'
Bundler.require
#on fait un appel au gem installer

require_relative 'lib/game'
require_relative 'lib/player'
#on lie les fichiers contenant les classes 


player1 = Player.new("Josiane")
player2 = Player.new("José")
#on crée deux instances de classe Player qui seront les bots

while player1.life_point > 0 && player2.life_point >0 #les commande qui suivent sont executer temps que les pv sont superieur a 0

puts "------------------------------------"
puts "voici l'état de nos participant\n\n"
player1.show_state
player2.show_state

puts "-----------"
puts "HAJIME\n\n"
player1.attacks(player2)
	if player2.life_point <= 0
		puts "le combattant #{player2.name} a été tué!"
		break
	end
player2.attacks(player1)
	if player1.life_point <= 0
		puts "le combattant #{player1.name} a été tué!"
		break
	end
	#si les pv d'un player arrive a 0 le jeu s'arréte.
end
binding.pry
