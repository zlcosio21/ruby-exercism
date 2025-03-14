class Element
  def self.new(data)
    new_element = allocate
    return data if data.is_a?(Element)

    new_element.send(:initialize, data)
    new_element
  end

  def initialize(value)
    self.value = value
  end

  attr_accessor :value, :next

  alias datum value
end

class SimpleLinkedList
  private

  attr_accessor :root

  def initialize(elements = [])
    elements.each { |element| push(element) }
  end

  def unset
    self.root = nil
  end

  def unset?
    root.nil?
  end

  def set(element)
    self.root = element
  end

  def set?
    not unset?
  end

  def traverse_list(node)
    while node.next
      node = node.next
    end

    node
  end

  public

  def push(element)
    element = Element.new(element)

    if unset?
      set(element)
    else
      node = traverse_list(root)
      node.next = element
    end

    self
  end

  def pop
    return nil if unset?

    node = root
    previous = node

    while node.next
      previous = node
      node = node.next
    end

    previous.next = nil
    node
  end

  def reverse!
    return self unless set?

    previous_node = nil
    current_node = root

    while current_node
      next_node = current_node.next
      current_node.next = previous_node
      previous_node = current_node
      current_node = next_node
    end

    set(previous_node)
    self
  end

  def to_a
    return [] if unset?

    list = []
    current_node = root

    while current_node
      list << current_node.value
      current_node = current_node.next
    end

    list.reverse
  end
end
