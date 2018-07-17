require_relative 'boardCase'

class Board 
    attr_accessor :board
    def initialize(board=[])
        9.times do
            board<<BoardCase.new()
        end
        @board=board.map{|h| h.boardCase}


    end
    def affichage
        puts"   1   2   3"
        puts"   ---------"
        puts"1  #{@board[0]} | #{@board[1]} | #{@board[2]}"
        puts"   ---------"
        puts"2  #{@board[3]} | #{@board[4]} | #{@board[5]}"
        puts"   ---------"
        puts"3  #{@board[6]} | #{@board[7]} | #{@board[8]}"
        puts"   ---------"
        puts"   1   2   3"
    end
    def game_over?
        [@board[0], @board[1], @board[2]].uniq.size == 1 && [@board[0], @board[1], @board[2]].uniq!=[" "]||
        [@board[3], @board[4], @board[5]].uniq.size == 1 && [@board[3], @board[4], @board[5]].uniq!=[" "]||
        [@board[6], @board[7], @board[8]].uniq.size == 1 && [@board[6], @board[7], @board[8]].uniq!=[" "]||
        [@board[0], @board[3], @board[6]].uniq.size == 1 && [@board[0], @board[3], @board[6]].uniq!=[" "]||
        [@board[1], @board[4], @board[7]].uniq.size == 1 && [@board[1], @board[4], @board[7]].uniq!=[" "]||
        [@board[2], @board[5], @board[8]].uniq.size == 1 && [@board[2], @board[5], @board[8]].uniq!=[" "]||
        [@board[0], @board[4], @board[8]].uniq.size == 1 && [@board[0], @board[4], @board[8]].uniq!=[" "]||
        [@board[2], @board[4], @board[6]].uniq.size == 1 && [@board[2], @board[4], @board[6]].uniq!=[" "]
    end
    def tie
        !@board.include?(' ')
    end
end