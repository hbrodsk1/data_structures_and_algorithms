class Board
	def initialize
		@board = Array.new(8){Array.new(8)}
		#@board.each do |row|
		#	puts row.each {|c| c}.join(" ") 
		#end
	end
end


class Node
	attr_accessor :position, :parent, :children 

	def initialize(position, parent = nil, children = [])
		@position = position
		@parent = parent
		@children = children
	end
end

class Knight

	def initialize(root, destination)
		@root = Node.new(root)
		@destination = Node.new(destination)

		possible_moves(@root)
	end


def possible_moves(node)
	legal_moves = []
	legal_moves.push(
		[node.position[0] + 2, node.position[1] + 1],
		[node.position[0] + 2, node.position[1] - 1],
		[node.position[0] + 1, node.position[1] + 2],
		[node.position[0] + 1, node.position[1] - 2],
		[node.position[0] - 2, node.position[1] + 1],
		[node.position[0] - 2, node.position[1] - 1],
		[node.position[0] - 1, node.position[1] + 2],
		[node.position[0] - 1, node.position[1] - 2]
		)

	legal_moves.select! do |pair|
		pair[0] <= 8 && pair[0] >= 0 && pair[1] <= 8 && pair[1] >= 0
	end

	#legal_moves
	children_nodes(legal_moves)
end

def children_nodes(arr)
	arr.each do |child|
		new_node = Node.new(child)
		@root.children << new_node
		new_node.parent = @root
	end
 	breadth_first_search(@root.children)	
end

	def breadth_first_search(arr)
		queue = arr
		current_node = queue.shift
		
		while !queue.empty?
			if current_node.position == @destination.position
				puts "found it!"
				return current_node
			else breadth_first_search(queue)
			end 
		end
	end
end

def knight_moves(start_space, end_space)
	Board.new
	Knight.new(start_space, end_space)

	
end


knight_moves([4,4], [6,3])
