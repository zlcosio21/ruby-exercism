class Node

  def initialize(value)
    self.value = value
  end

  attr_accessor :value,
                :next_node,
                :previous_node

end

class Deque

  private

  attr_accessor :root

  def unset
    self.root = nil
  end

  def unset?
    root.nil?
  end

  def set?
    not unset?
  end

  def last_node(node)
    if node.next_node.nil?
      node
    else
      last_node(node.next_node)
    end
  end

  public

  def push(value)
    new_node = Node.new(value)

    if unset?
      self.root = new_node
    else
      node = last_node(root)
      node.next_node = new_node
      new_node.previous_node = node
    end
  end

  def pop
    if unset?
      nil
    elsif root == last_node(root)
      value = root.value
      unset
      value
    else
      node = last_node(root)
      previous = node.previous_node
      previous.next_node = nil
      node.value
    end
  end

  def shift
    if unset?
      nil
    else
      new_root = root.next_node
      value = root.value
      self.root = new_root
      set? and root.previous_node = nil
      value
    end
  end

  def unshift(value)
    new_node = Node.new(value)

    if unset?
      self.root = new_node
    else
      new_root = new_node
      new_root.next_node = root
      root.previous_node = new_root
      self.root = new_root
    end
  end

end
