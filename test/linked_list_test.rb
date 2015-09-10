gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/linked_list'

class LinkedListTest < Minitest::Test
  def test_that_empty_list_print_nil
    list = LinkedList.new
    assert_equal nil, list.print_list
  end

  def test_that_it_points_to_nil
    list = LinkedList.new
    assert_equal nil, list.head.next_node
  end

  def test_that_it_can_take_start_input
    list = LinkedList.new("one")
    assert_equal "one", list.print_list
  end

  def test_that_it_still_points_to_nil
    list = LinkedList.new("one")
    assert_equal nil, list.head.next_node
  end

  def test_that_it_can_append_node_to_empty
    list = LinkedList.new
    list.append("two")
    assert_equal "two", list.head.data
  end

  def test_that_it_can_append_multiple_times
    list = LinkedList.new
    list.append("one")
    list.append("two")
    list.append("three")
    assert_equal "one two three", list.print_list
  end

  def test_that_it_points_to_right_thing
    list = LinkedList.new
    list.append("one")
    list.append("two")
    list.append("three")
    assert_equal "two", list.head.next_node.data
    assert_equal "three", list.head.next_node.next_node.data
  end

  def test_that_it_can_prepend_node_to_empty
    list = LinkedList.new
    list.prepend("two")
    assert_equal "two", list.head.data
  end

  def test_that_it_can_prepend_node_to_populated_list
    list = LinkedList.new("one")
    list.prepend("two")
    assert_equal "two", list.head.data
  end

  def test_it_still_points_to_right_thing_after_prepend
    list = LinkedList.new("one")
    list.prepend("two")
    assert_equal "one", list.head.next_node.data
  end

  def test_it_still_points_to_right_thing_two_in_after_prepend
    list = LinkedList.new("one")
    list.prepend("two")
    assert_equal "one", list.head.next_node.data
    assert_equal nil, list.head.next_node.next_node
  end

  def test_that_it_can_insert_at_position_one
    list = LinkedList.new("zero")
    list.append("one")
    list.append("two")
    list.insert(1, "three")
    assert_equal "three", list.head.next_node.data
  end

  def test_that_everyone_is_still_in_list_after_insert
    list = LinkedList.new("zero")
    list.append("one")
    list.append("two")
    list.insert(1, "three")
    assert_equal "three", list.head.next_node.data
    assert_equal "one", list.head.next_node.next_node.data
    assert_equal "two", list.head.next_node.next_node.next_node.data
  end

  def test_that_it_can_confirm_included_nodes
    list = LinkedList.new("zero")
    list.append("one")
    list.append("two")
    assert list.includes?("two")
  end

  def test_that_it_can_refute_notes_that_are_not_included
    list = LinkedList.new("zero")
    list.append("one")
    list.append("two")
    refute list.includes?("three")
  end

  def test_that_it_can_pop_one_node
    list = LinkedList.new("zero")
    list.append("one")
    list.append("two")
    list.pop(1)
    assert_equal "zero one", list.print_list
  end

  def test_that_it_can_pop_two_nodes
    list = LinkedList.new("zero")
    list.append("one")
    list.append("two")
    list.pop(2)
    assert_equal "zero", list.print_list
  end

  def test_that_it_can_return_elements_popped
    list = LinkedList.new("zero")
    list.append("one")
    list.append("two")
    assert_equal "one two", list.pop(2)
  end

  def test_that_it_can_count
    list = LinkedList.new("zero")
    list.append("one")
    list.append("two")
    assert_equal 3, list.count
  end

  def test_that_it_can_find_one_element
    list = LinkedList.new("zero")
    list.append("one")
    list.append("two")
    assert_equal "one", list.find(1, 1)
  end

  def test_that_it_can_find_two_elements
    list = LinkedList.new("zero")
    list.append("one")
    list.append("two")
    list.append("three")
    assert_equal "two three", list.find(2, 2)
  end

end
