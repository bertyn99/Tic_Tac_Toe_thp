require_relative 'board'
require_relative 'player'
class Game
    attr_accessor :J1, :J2, :tab
        
        def initialize 
            puts"bienvenue dans le Tic Tac Toe de bertyn "
            puts"entrer prenom joueur X"
            nameJ1=gets.chomp
            puts"entrer prenom joueur O"
            nameJ2=gets.chomp
            @J1=Player.new(value="X",name=nameJ1)
            @J2=Player.new(value="O",name=nameJ2)
            @tab=Board.new()
            @symb=true
        end
    
        def tour()
    puts 'Rentrz un nombre de 1 a 9 afin de choisir vos(lcase 1 est en haut a gauche'
        @coord=gets.chomp.to_i-1
        while @coord<0||@coord>9
            puts"Error"
            puts "Rentrz un nombre de 1 a 9 afin de choisir"
            @coord=gets.chomp.to_i-1
        end
        if @tab.board[(@coord.to_i)].include?" "
           
        if @symb==true
                @tab.board[(@coord.to_i)]=@J1.value
                 @tab.affichage
            else @symb==false
                @tab.board[(@coord.to_i)]=@J2.value
                @tab.affichage
            end
        else
            puts"------Erreur cette casse est occupé!!!!------"
            puts "--Rentrez un nombre une boardcase inocupé!!!--"
            tour()
        end
        @symb=!@symb  # a la fin du tour la valeur symbole change afin d empecher le mem symbole de joué 2fois
        end
       
    
        
        def start
            #lance le jeu du tictactoe
            while !self.tab.game_over?
             self.tour
                if self.tab.tie
                puts "match nul"
                break
    
                end 
            end
            if self.tab.game_over? && @symb==false
                puts "C'est #{@J1.name} X qui a gagné"
            elsif self.tab.game_over? && @symb==true
                puts "C'est #{@J2.name} O qui a gagné"
            end
        end
    end
    gam1=Game.new
    gam1.start