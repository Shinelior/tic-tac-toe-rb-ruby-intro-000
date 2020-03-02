def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

  def input_to_index(input)
    index=input.to_i-1
  end
  
 
  def move(board,index,player)
    
  player= "X"
  
  board[8]= 'X'
  
  player = "O"
  
    board[0]= 'O'
  end
    
   
 
  
  def position_taken?(board,position=index)
     if  !(board[index].nil? || board[index]==" ")
        board[0]="X"
        board[8]= "O"
     return true
   else
     return false
  end
      
 def  valid_move?(board, index)
      if index >=0 && index <= 8 && position_taken?(board,position=index) == false  
        return true
      else
        return nil
      end
    end
  def turn(board)
    puts "please choose your position between 1-9"
    input = gets.chomp
    index=input_to_index(input)
    if valid_move?(board, index)==true
       move(board,index, player)
       display_board(board)
    else
      while valid_move?(board, index)==true
       turn(board) 
       end 
     end
    end  
  
   def turn_count(board)
      count=0
         if board.each{|index| position_taken?(board,position=index)==true}
            count+=1
          end
      return count
   end
   def current_player?(board)
     if turn_count(board).even? == false
       return "X"
     else
       return "O"
     end
   end
   def won?(board)
   if board[0]== "x" && board[1]=="X" && board[2]=="X"
       return WIN_COMBINATIONS[0]
       elsif board[3]=="X" && board[4]=="X"&& board[5]=="X"
         return WIN_COMBINATIONS[1]
       elsif board[6]=="X" && board[7]=="X"&& board[8]=="X"
         return WIN_COMBINATIONS[2]
       elsif board[0]=="X" && board[3]=="X"&& board[6]=="X"
         return WIN_COMBINATIONS[3]
       elsif board[1]=="O" && board[4]=="O"&& board[7]=="O"
         return WIN_COMBINATIONS[4]
       elsif board[2]=="X" && board[5]=="X"&& board[8]=="X"
         return WIN_COMBINATIONS[5]
       elsif board[0]=="X" && board[4]=="X"&& board[8]=="X"
         return WIN_COMBINATIONS[6] 
       elsif board[6]=="O" && board[4]=="O"&& board[2]=="O"
         return WIN_COMBINATIONS[7]
      else
        return false
   end
 end
   def full?(board)
     if board.each{|index| index=="X"|| index=="O"}
       return true
     end
   end
   
   def draw?(board)
     if full?(board)==true&& won?(board)==false
       return true
     elsif full?(board)==false&& won?(board)==false
      return false
    else
      return false
    end
   end
   def over?(board)
     if won?(board)!=false || draw?(board)==true || full?(board)==true
       return true
   end
 end
 def winner(board)
    if won?(board)!=false
      if won?(board)==WIN_COMBINATIONS[6]
        return "X"
        elsif won?(board)==WIN_COMBINATIONS[4]
        return "O"
      end
     else
       return "nil"
   end
 end
 def play(board)
      turn(board)
   if over?(board)== true
      if winner(board)== "X"
        puts "congratulate X the winner"
      elsif winner(board)== "O"
        puts "congratulate O the winner"
      elsif draw?(board)==true
       puts  "Cat\'s Game!"
     end
   else 
     
    while over?(board)== false
        turn(board)
      end
    end  
   
end








WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]