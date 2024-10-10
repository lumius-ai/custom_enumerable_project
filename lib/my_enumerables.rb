module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for item in self
      yield(item, index)
      index += 1
    end
    return self
  end

  def my_select
    out_array = []
    
    for item in self
      out_array << item if yield(item)
    end

    return out_array
  end

  # Returns true if all elements match criteria
  def my_all?
    out_array = []

    for item in self
      out_array << item if yield(item)
    end
    out_array == self ? true : false
  end

  # Returns true if at least one element matches criteria
  def my_any?
    for item in self
      return true if yield(item)
    end
    return false
  end

  # Returns true if NONE of the elements matches criteria
  def my_none?
    for item in self
      return false if yield(item)
    end
    return true
  end

  # Returns size of enumerable if no block, else returns number of elements satisfying condition
  def my_count
    if block_given?
      count = 0
      for item in self
        count += 1 if yield(item)
      end
      return count
    else
      return self.length
    end
  end

  # Perform an action on each element, returning alteration
  def my_map
    out_array = []

    for item in self
      out_array << yield(item)
    end

    return out_array
  end

  # Perform some calculation, return outcome, keeping one pipe as running total
  def my_inject(initial_value=0)
    running_total = initial_value

    for item in self
      running_total = yield(running_total, item)
    end

    return running_total
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield(item)
    end
    return self
  end
  
end
