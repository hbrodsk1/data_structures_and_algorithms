class Node
	attr_accessor :value, :child_right, :child_left, :parent

	def initialize(value, parent = nil, child_right = nil, child_left = nil)
		@value = value
		@parent = parent
		@child_right = child_right
		@child_left = child_left
	end

	def check_value(val)
		if val <= self.value && self.child_left.nil?
			self.child_left = Node.new(val, self)
		elsif val <= self.value && !self.child_left.nil?
			self.child_left.check_value(val)
		elsif val > self.value && self.child_right.nil?
			self.child_right = Node.new(val, self)
		elsif val > self.value && !self.child_right.nil?
			self.child_right.check_value(val)	
		end	
	end

	def breadth_first_search(target)
		queue = []
		queue.push(self)
		
		while !queue.empty?
			current_node = queue.shift
			puts current_node.value

			if current_node.value == target
				return puts current_node
			end

			if !current_node.child_left.nil?
				queue.push(current_node.child_left)
			end

			if !current_node.child_right.nil?
				queue.push(current_node.child_right)
			end
		end

		if queue.empty?
			puts "Node not found"
		end
	end

	def depth_first_search(target)
		stack = []
		stack.push(self)

		while !stack.empty?
			current_node = stack.pop
			puts current_node.value

			if current_node.value == target
				return puts current_node
			end

			if !current_node.child_left.nil?
				stack.push(current_node.child_left)
			end

			if !current_node.child_right.nil?
				stack.push(current_node.child_right)
			end
		end

		if stack.empty?
			puts "Node not found"
		end
	end

end

	def build_tree(array)
		tree = Node.new(array[0])

		array.each_with_index do |value, index|
			if index > 0
				tree.check_value(value)
			end
		end
		tree
	end

	def check_tree(tree, level = 0)
		if !tree.child_right.nil? || !tree.child_left.nil?
			puts "Level: #{level}"

			puts "Right Branch: #{tree.value} => #{tree.child_right.value}" if !tree.child_right.nil?
			puts "Left Branch: #{tree.value} => #{tree.child_left.value}" if !tree.child_left.nil?

			check_tree(tree.child_right, level + 1) if !tree.child_right.nil?
			check_tree(tree.child_left, level + 1) if !tree.child_left.nil?
		end
	end



	

tree = build_tree([100, 1, 4, 23, 8, 9, 5, 7, 67, 6345, 324])
check_tree(tree)
tree.depth_first_search(23)
tree.breadth_first_search(23)

