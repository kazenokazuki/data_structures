class Node 
	attr_accessor :value, :left, :right, :parent
	def initialize(value = nil)
	@value = value
	end
	
	def set(input)
		case  value <=> input
		when 1 then propagate_left(input)
		when -1 then propagate_right(input)
		when 0 then return false
		end
	end
	
	def propagate_left(input)
		if left
			left.set(input)
		else
			self.left = Node.new(input)
		end
	end
	
	def propagate_right(input)
		if right
			right.set(input)
		else
			self.right = Node.new(input)
		end
	end
	
	def display
		"#{self.value}: {L#{self.left.display} R#{self.right.display}}"
	end
	
	def bfs(find)
		if self.value == find
		puts "#{self}: #{self.value}"
		return true 
		end
	end
	
	def breadth_first_search(find)
		unless bfs(find)
		queue = []
		queue << self.left if self.left
		queue << self.right if self.right
		queue.each do |node|
			if node.bfs(find) == true
				puts "Attempts #{queue.index(node)+1}"
				break
			else
			queue << node.left if node.left
			queue << node.right if node.right
			end
		end
		else
		puts "root"	
		end
	end
	
	def dfs(find)
		if value == find
		puts "#{self}: #{self.value}"
		else
		left.dfs(find) if left
		right.dfs(find) if right
		end
	end
end

class Tree
	attr_accessor :root
	def initialize(root = Node.new)
		@root = root
	end
	
	def tree_builder(arr)
		root.value = arr[0]
		arr.each do |val|
			root.set(val)
		end
	end
end

tree = Tree.new
tree.tree_builder([5,7,9,2,3])
tree.root.breadth_first_search(9)
tree.root.dfs(9)
