

class Player 
	attr_accessor :name, :life_point #on permet la lecture et la modification de ces variables

	def initialize(name_player) #actions qui s'exécuteront dès lors de la création d'une nouvelle instance
		@name = name_player
		@life_point = 10 #n'est pas prit en argument dans la méthode car a une valeur fixe
	end

	def show_state
		puts "#{name} a #{life_point} neuronne." #affiche l'état d'une instance (nom + PV)
	end

	def gets_damage(dammage)#permet à l'instance de perdre des PV en prenant en agrument le nobre de Pv perdus
		@life_point -= dammage

	end

	def attacks(target) #permet à l'instance de diminuer les Pv d'une autre instance
		hit = compute_damage #le nombre de dégats est le résultat d'un dé 6
		puts "#{name} a latté les couilles de #{target.name}"
		target.gets_damage(hit) #l'instance visée reçoit les dégats du dé via la méthode précédente
		puts "#{target.name} a perdu #{hit} neuronnes"
	end

	def compute_damage
    	return rand(1..6)
  	end

end

class HumanPlayer < Player #classe avec héritage de la classe Player

	attr_accessor :weapon_level #on ajoute une variable

	def initialize(name)
		@name = name
		@life_point = 100 #augmentation du nombre de PV
		@weapon_level = 1 #initialisation de la nouvelle variable
	end 

	def show_state #modification de la méthode show_state ne s'appliquant qu'à la classe HumanPlayer
		return "#{name} a #{life_point} points de vie et ainsi qu'une arme de niveau #{weapon_level}"
	end

	def compute_damage
		rand(1..6) * @weapon_level #le niveau de l'arme à une incidence sur les dégats causés
	end 

	def search_weapon #permet au joueur de changer d'arme pour une autre choisie au hasard
		found_weapon = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{found_weapon}"
		if found_weapon > @weapon_level
			@weapon_level = found_weapon
			puts "Tu as trouvé une arme plus puissante que la tienne ! Bravo, tu peux la garder !"
		else 
			puts "Bordel de merde, cette arme est moins puissante que la tienne ! Poubelle !"
			# une arme dont le niveau est supérieur à celui de celle du joueur ne peut être ramassée
		end 
	end 

	def search_health_pack
		item = rand(1..6) #recherche d'un pack de récupération de Pv basée sur un jet de dé
		if item  == 1
			puts "Tu n'as rien trouvé..."
		elsif item == (2..5)
			@life_point += 50
			@life_point > 100 ? @life_point = 100 : @life_point #les PV max sont bloqués à 100
			puts "Tu as trouvé une potion, +50 PV !"
		else 
			@life_point += 80
			@life_point > 100 ? @life_point = 100 : @life_point #les PV max sont bloqués à 100
			puts "Tu as trouvé une super potion, +80 PV !"
		end 
	end 

end 
