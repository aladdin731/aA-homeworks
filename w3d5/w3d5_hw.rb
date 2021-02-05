class Stack

  attr_reader :arr 
    def initialize
      # create ivar to store stack here!
      @arr = []
    end

    def push(el)
      # adds an element to the stack
      arr << el 
    end

    def pop
      # removes one element from the stack
      arr.pop  
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      arr[-1]
    end

    private
    attr_reader :arr 
  end


  class Queue 

    attr_reader :arr 

    def initialize
      @arr = []
    end
    def enqueue(el)
      arr << el 
      self 
    end

    def dequeue
      arr.shift 
    end

    def peek
      arr[0]
    end

    private
    attr_reader :arr 
  end

  class Map
    # with 2d array
    # my_map = [[k1, v1], [k2, v2], [k3, v2], ...]

    attr_reader :arr 
    def initialize
      @arr = []
    end

    def set(key, value)
      # create/update 
      key_index = arr.index {|pair| pair[0] == key}
      if key_index
        arr[key_index][1] = value 
      else
        arr << [key, value]
      end
      value 
    end

    def get(key)
      target = arr.select {|pair| pair[0] == key}
      if target.length == 0
        return nil 
      else
        return target[1]
      end
    end

    def delete(key)
      value = get(key)
      arr.reject! {|ele| ele[0] == key}
      value 
    end

    def show
      arr.dup 
      # 不让外部修改真正的
    end
  end
