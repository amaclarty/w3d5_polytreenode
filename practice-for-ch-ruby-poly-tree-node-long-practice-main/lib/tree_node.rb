require "Byebug"
# debugger
class PolyTreeNode
    
    def initialize(value)
        @parent = nil 
        @value = value 
        @children = [] 
    end

    def parent=(new_parent)
 
   
        if self.parent && new_parent

            self.parent.children.delete(self)
            @parent = new_parent
            
            new_parent.children << self 
        elsif !new_parent && self.parent 
        
            self.parent.children.delete(self)
            @parent = new_parent
        else
            @parent = new_parent
     
            new_parent.children << self
        end
    end


    def add_child(child)
        # child.parent.children.delete(child) 
        # children << child 
        child.parent = self  
    end   
    
    def remove_child(child)
        child.parent=(nil)

    end    

    def dfs(target_value)
        return self if self.value == target_value 
        self.children.each do |child|
            result = child.dfs(target_value)
            return result if result 
        end
        #return result if result
        nil 
    end

    def bfs(target)
        # return self if self.value == target
        queue = []
        queue.push(self)
        queue.each do |node|
            1st = queue.shift
            return 1st if 1st.value == target 
            node.child.bfs(target)
        end    
        nil     
    end



# target = e
#   a
#  b c
#d e  f g 
#
#   
#       self.bfs(e)
#       queue = [a]
#       a == e ?
#       [b,c]
#       call next bfs(b)
#       [b]
#
#



    attr_reader :parent, :children, :value
end 

# class Array 
    

# end    


