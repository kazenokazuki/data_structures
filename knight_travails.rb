class Knight
	attr_accessor :x, :y, :subqueue, :parent, :n
	def initialize(moves = [], x = [], y = [], count = 0)
	@parent = parent
	@count = count
	@moves = moves
	@x = x 
	@y = y
	@moves = [[2,1],[2,-1],[1,2],[1,-2],[-1,2],[-1,-2],[-2,1],[-2,-1]] 
	@subqueue = []
	end
	
	def starting(x,y)
		@x[0] = x
		@y[0] = y
	end
		
	def match(x_end,y_end)	
		@n = 0
		@moves.each do |i,j|
			@n += 1
			@x[@n] = @x[0] + i
			@y[@n] = @y[0] + j
			if @x[@n] == x_end && @y[@n] == y_end
				return 1
				break
			elsif @x[@n].between?(0, 7) && @y[@n].between?(0, 7)
				@knightcopy = Knight.new
				@knightcopy.starting(@x[@n],@y[@n])
				@knightcopy.parent = self
				@subqueue << @knightcopy
			end
		end
	end
end

class KnightSearch
	def initialize(start = [0,0],finish = [0,0])	
	x_start, y_start = start[0], start[1]
	x_end, y_end = finish[0], finish[1]
	@queue = []
	trace(x_start,y_start,x_end,y_end)
	end
	
	def trace(x_start,y_start,x_end,y_end)
	@knight = Knight.new
	@knight.starting(x_start,y_start)
	@knight.match(x_end,y_end)
	if @knight.match(x_end,y_end) == 1 
		solution = [[x_start,y_start],[x_end,y_end]]
		puts "shortest path in 1 move"
		p solution
	else
	@knight.subqueue.each {|piece| @queue << piece}
	iterate(x_end,y_end)
	end
	end
	
	def iterate(x_end,y_end)
	@queue.each do |value|
		if value.match(x_end,y_end) == 1
		solution = [[x_end,y_end],[value.x[0],value.y[0]]]
			until value.parent == nil
			solution << [value.parent.x[0],value.parent.y[0]]
			value = value.parent
			end
		puts "shortest path in #{solution.length-1} moves"
		solution.reverse.each {|coordinates| p coordinates}
		break
		else
		value.subqueue.each {|piece| @queue << piece}
		end
	end
	end
end

KnightSearch.new([4,4],[4,6])
puts "Knight Travails"
