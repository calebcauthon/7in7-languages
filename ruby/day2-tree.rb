class Tree
	attr_accessor :children, :node_name
	
	def initialize(tree_hash)
		tree = tree_hash.to_a[0]
		
		@node_name = tree[0]
		@children = tree[1].to_a.collect { |branch| Tree.new({ branch[0] => branch[1] }) }
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


