gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/jungle_beat'

class JungleBeatTest < Minitest::Test
  def test_that_it_runs
  end

  def test_that_it_prints_empty_list
    skip
  end

  def test_that_it_will_make_each_word_separate_node
    jb = JungleBeat.new("beep beep beep")
    assert_equal "beep", jb.list.head.data
  end

  def test_that_it_will_make_separate_nodes_and_can_call_them
    jb = JungleBeat.new("beep boop beep")
    assert_equal "boop", jb.list.head.next_node.data
  end

  def test_that_it_can_append_a_beat
    jb = JungleBeat.new("beep boop beep")
    jb.append("deep")
    assert_equal "deep", jb.list.find_tail.data
  end

  def test_that_it_can_append_a_beat_string_as_separate_nodes
    jb = JungleBeat.new("beep boop beep")
    jb.append("deep doop")
    assert_equal "deep", jb.list.head.next_node.next_node.next_node.data
  end

  def test_that_it_can_prepend_a_beat
    jb = JungleBeat.new("beep boop beep")
    jb.prepend("tee")
    assert_equal "tee beep boop beep", jb.all
  end

  def test_that_prepend_not_backwards
    jb = JungleBeat.new("beep boop beep")
    jb.prepend("tee1 tee2")
    assert_equal "tee1 tee2 beep boop beep", jb.all
  end

  def test_that_it_can_insert
    jb = JungleBeat.new("beep boop beep")
    jb.insert(1, "new")
    assert_equal "beep new boop beep", jb.all
  end

  def test_that_it_can_insert_multiple_beats_in_right_order
    jb = JungleBeat.new("beep boop beep")
    jb.insert(1, "new1 new2")
    assert_equal "beep new1 new2 boop beep", jb.all
  end

  def test_that_everything_points_where_it_should_after_insert
    jb = JungleBeat.new("beep boop beep")
    jb.insert(1, "new1 new2")
    assert_equal "beep new1 new2 boop beep", jb.all
    assert_equal "new1", jb.list.head.next_node.data
    assert_equal "boop", jb.list.head.next_node.next_node.next_node.data
  end

  def test_that_it_can_confirm_included_nodes
    jb = JungleBeat.new("beep boop beep")
    assert jb.includes?("boop")
  end

  def test_that_it_can_refute_nodes_that_are_not_included
    jb = JungleBeat.new("beep boop beep")
    refute jb.includes?("tee")
  end

  def test_that_it_can_pop_one_node
    jb = JungleBeat.new("beepo boop beep")
    jb.pop(1)
    assert_equal "beepo boop", jb.all
  end

  def test_that_it_can_pop_two_nodes
    jb = JungleBeat.new("beepo boop beep")
    jb.pop(2)
    assert_equal "beepo", jb.all
  end

  def test_that_it_can_count
    jb = JungleBeat.new("beepo boop beep")
    assert_equal 3, jb.count
  end

  def test_that_it_can_find_two_elements
    jb = JungleBeat.new("beepo boop beep")
    assert_equal "boop beep", jb.find(1,2)
  end
end
