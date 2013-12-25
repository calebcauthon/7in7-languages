class Tree
	attr_accessor :children, :node_name
	
	def initialize(tree_hash)
		tree = tree_hash.to_a[0]
		
		@node_name = tree[0]
		
		slices = []
		tree[1].to_a.each do |branch|
			hash = { branch[0] => branch[1] }
			slices << hash
		end

		@children = slices.collect { |s| Tree.new(s) }
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end
	
	def visit(&block) 
		block.call self
	end 
end

def family
	Tree.new( { 'grandpa' => { 'dad' => { 'son' => {}, 'daughter' => {} }, 'uncle' => { 'cousin' => {} } } } )
end

def visit this_family
	this_family.visit_all { |p| puts p.node_name }
end


