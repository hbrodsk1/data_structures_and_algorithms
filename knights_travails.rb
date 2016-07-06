class Board
	def initialize
		@board = Array.new(8){Array.new(8)}
		#@board.each do |row|
		#	puts row.each {|c| c}.join(" ") 
		#end
	end
end


class Node
	attr_accessor :position, :parent, :children, :level

	def initialize(position, level = 0, parent = nil, children = [])
		@position = position
		@parent = parent
		@children = children
		@level = level
	end
end

class Knight


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

	return children_nodes(legal_moves, node)
end

def children_nodes(arr, root)
	ret = []
	arr.each do |child|
		new_node = Node.new(child, root.level + 1)
		new_node.parent = root
		ret << new_node
	end
	return ret
end

	def breadth_first_search(start_space, end_space)
		start = Node.new(start_space)
		end_node = Node.new(end_space)

		queue = []
		queue << start

		visited = Hash.new
		visited[start.position] = true
		

		while !queue.empty?
			current_node = queue.shift

			if current_node.position == end_node.position
				puts "You made it in #{current_node.level} moves!"
				puts "Here is your path:"
				return current_node
			else
				children = possible_moves(current_node)
				children.select! { |node| !visited.has_key?(node.position) }
				children.each { |node| visited[node.position] = true }
				queue += children
			end
		end
		
	end
end

def knight_moves(start_space, end_space)
	Board.new
	knight = Knight.new
	final = knight.breadth_first_search(start_space, end_space)

	until final == nil
		p final.position
		final = final.parent
	end
end


knight_moves([0,0], [2,0])
