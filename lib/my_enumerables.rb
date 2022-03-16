module Enumerable
  # Your code goes here
  def my_each_with_index(&prc)
    i = 0
    my_each do |ele|
      prc.call(ele, i)
      i += 1
    end
    self
  end

  def my_select(&prc)
    new_arr = []
    my_each do |ele|
      new_arr << ele if prc.call(ele)
    end
    new_arr
  end

  def my_all?(&prc)
    my_each { |ele| return false unless prc.call(ele) }
    true
  end

  def my_any?(&prc)
    my_each { |ele| return true if prc.call(ele) }
    false
  end

  def my_none?(&prc)
    my_each { |ele| return false if prc.call(ele) }
    true
  end

  def my_count(&prc)
    return self.length if prc.nil?

    count = 0
    my_each { |ele| count += 1 if prc.call(ele) }
    count
  end

  def my_map
    new_arr = []
    my_each { |ele| new_arr << yield(ele) }
    new_arr
  end

  def my_inject(accumulator, &prc)
    my_each do |ele|
      accumulator = prc.call(accumulator, ele)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
end
