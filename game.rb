require_relative 'board'
require_relative 'player'

class Game
    attr_accessor :J1, :J2, :tab
        
        def initialize 
            puts "   |--**~^^^^^^^~**--|" #petit logo du jeu (oui j'avais du temps a perdre xD)
            puts"   |  Tic Tac Toe    |"
            puts "   |----**~vVv~**----|"
            puts"bienvenue dans le Tic Tac Toe de bertyn "
            puts"entrer prenom joueur X"
            nameJ1=gets.chomp #nom des joueure que l'on recupère
            puts"entrer prenom joueur O"
            nameJ2=gets.chomp #nom des joueure que l'on recupère
            @J1=Player.new(value="X",name=nameJ1)#initialisationdes joueur
            @J2=Player.new(value="O",name=nameJ2)
            @tab=Board.new()
            @symb=true
        end
    
        def tour()
    puts "Rentrez un nombre de 1 a 9 afin correspondant à la case ou vs voulez jouer \n (les case sont numérotés de 1 a 9 en commençant par la case en haut a gauche)"
        @coord=gets.chomp.to_i-1
        while @coord<0||@coord>9
            puts"Error"
            puts "Rentrz un nombre de 1 a 9 afin de choisir"
            @coord=gets.chomp.to_i-1
        end
        if @tab.board[(@coord.to_i)].include?" "
           
        if @symb==true
                @tab.board[(@coord.to_i)]=@J1.value #attribution de la valeur X à la case correspondante a cette coordoné
                 @tab.affichage #appel de l'affichage a chaque tour
            else @symb==false
                @tab.board[(@coord.to_i)]=@J2.value #attribution de la valeur O à la case correspondante a cette coordoné
                @tab.affichage#appel de l'affichage a chaque tour
            end
        else
            puts"------Erreur cette casse est occupé!!!!------"
            puts "--Rentrez un nombre d'une case inocupé!!!--"
            tour()
        end
        @symb=!@symb  # a la fin du tour la valeur symbole change afin d empecher le mem symbole de joué 2fois
        end
       
    
        
        def start
            #lance le jeu du tictactoe
            while !self.tab.game_over?
             self.tour
                if self.tab.tie #Savoir si la grille est pleine pour le cas d'égalité
                puts "match nul"
                break #brise la boucle si il ya un match nul
    
                end 
            end
            #condition qui designe j1 ou j2 vainqueur
            if self.tab.game_over? && @symb==false#
                puts "C'est #{@J1.name} X qui a gagné"
            elsif self.tab.game_over? && @symb==true
                puts "C'est #{@J2.name} O qui a gagné"
            end
        end
    end
    gam1=Game.new#initialisation de l'instant game1
    gam1.start #lancement du jeu