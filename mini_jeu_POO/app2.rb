require 'bundler'
Bundler.require 
#on fait un appel au gem installer

require_relative 'lib/game'
require_relative 'lib/player' 
#on lie les fichiers contenant les classes 

puts " \t ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n \t Bienvenue sur ''Cartman Party'' \n \t Qui sera le dernier survivant ? \n \t ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

puts "Quel est ton prénom ?"
firstname = gets.chomp.to_s

user = HumanPlayer.new("#{firstname}")
player1 = Player.new("Josiane")
player2 = Player.new("José") 
#on crée deux instances de classe Player qui seront les bots et une instance de la classe HumanPlayer qui sera le joueur

while user.life_point > 0 && (player1.life_point > 0 || player2.life_point > 0) 
# on itère tant que le joueur à des PV et tant que tous les bots ne sont pas morts
	
	puts " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n Voici l'état de #{user.name} : \n#{user.show_state} \n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	#on donne le nom + PV du joueur
	gets.chomp

	puts "Quelle action veux-tu effectuer ? \n\n d - apprendre le lattage expert? \n f - chercher une poche de glace? \n\n latter des couilles? \n\n a - #{player2.name} a #{player2.life_point} neurone \n z - #{player1.name} a #{player1.life_point} neurone"
	#on présente au joueur les choix qui lui sont offerts et l'état des ennemis
	action = gets.chomp 
	# la méthode correspondant est appelée en fonction de l'imput du joueur. Si il n'entre pas de commande valide, il passe son tour.
	if action == "d" 
		user.search_weapon
	elsif action == "f" 
		user.search_health_pack
	elsif action == "a"
		user.attacks(player2)
	elsif action == "z"
		user.attacks(player1)
	else
		puts "T'aurais pas oublier de jouer??'"
	end 

	puts "Diantre, protége ta bourse!"

	enemies = [player1, player2]

	enemies.each do |enemy| #chaque ennemi attaque sauf si ses PV = 0 
		if enemy.life_point > 0
			enemy.attacks(user)
		else 
			puts "#{enemy.name} est mort, il ne peut pas attaquer !"	
		end 
	end

end 

puts "\n~~ La partie est finie ~~\n "

if user.life_point > 0
	puts "~~ BRAVO ! Tu as gagné ~~" 
	# si les PV du joueur sont positifs à la sortie de la boucle, il gagne la partie
else 
	puts "~~ Bouh ! Tu as perdu ! ~~"
end 

binding.pry