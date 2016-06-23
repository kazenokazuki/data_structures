class Node 
	attr_accessor :value ,:next_node
	def initialize (value = nil, next_node = nil)
		@value = value
		@next_node = next_node
	end 
	
	def endlist
	end
		
end 

class LinkedList
	attr_accessor :head, :tail, :count, :traversal, :self
	def initialize(count = 0, head = Node.new)
		@head = head
		@tail = tail
		@count = count
		@tail = @head
	end
	
	def head
		@head
	end
	
	def tail
		@tail
	end
	
	def append(value) 
		push = Node.new(value)
			if @head.value == nil
				@head = push
				@tail = @head
	    	else
				@tail.next_node = push
				@tail = push
	    	end
	    @count += 1
	end
	
	def prepend(value)
		nextlink = @head
		shift = Node.new(value,nextlink)
		@head = shift
		@count += 1
	end
	
	def size
		@count
	end
	
	def at(index)
		search(index)
		puts "#{@traversal} : #{@traversal.value} \n Next Node #{@traversal.next_node}"
	end
	
	def search(index)
		@traversal = @head
		index -= 1
			if index == 0 
			else	
				index.times do
					@traversal = @traversal.next_node
				end
			end
	end
	
	def pop
		@tail = nil
	    self.search(@count-1)
	    @tail = @traversal
	    @tail.next_node = nil
	    @count -= 1
	    end
	    
	def contains?(data)
		@traversal = @head
		@count.times do 
			if @traversal.value == data
				return true
				break
			else	
				@traversal = @traversal.next_node
			end
		end
		return false
	end
	
	def find(data)
		@traversal = @head
		n = 0
		@count.times do 
			if @traversal.value == data
				puts "FIND OUPUT[INDEX#: #{n+1} ]"
				break
			else	
				@traversal = @traversal.next_node
			end
		n += 1	
		end
		return nil
	end
		
	def to_s
		@traversal = @head
		print " \n (#{@traversal.value})"
		n = @count - 1 
			n.times do
				@traversal = @traversal.next_node
				print " -> (#{@traversal.value})"
			end
		puts " -> nil"	
	end
		
end

list = LinkedList.new
list.append("hi")
list.append("bye")
list.prepend("first")
list.append("last")
list.find("first")
puts list.to_s
