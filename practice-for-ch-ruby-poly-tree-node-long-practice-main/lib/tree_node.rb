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

    

    # private 
    attr_reader :parent, :children, :value

end    


