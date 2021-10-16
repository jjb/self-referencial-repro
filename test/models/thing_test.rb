require "test_helper"

class ThingTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "thing can be created" do
    t = Thing.create!
    assert t.class == Thing
  end

  test "self-referential things get correct attributes assigned when newly created" do
    t1 = Thing.create!
    t2 = Thing.create!(thing: t1)
    t3 = Thing.create!(thing: t2)
    assert t3.thing_id
    assert !t1.thing_id
    assert t2.thing_id # fails. the above two succeed
  end

  test "self-referential things get correct attributes when loaded from db" do
    t1 = Thing.create!
    t2 = Thing.create!(thing: t1)
    t3 = Thing.create!(thing: t2)
    assert t3.reload.thing_id
    assert !t1.reload.thing_id
    assert t2.reload.thing_id
  end

  test "self-referential things point at created objects" do
    t1 = Thing.create!
    t2 = Thing.create!(thing: t1)
    t3 = Thing.create!(thing: t2)
    assert t3.thing.id==t2.id
    assert !t1.thing&.id # fails, points to t2
    assert t2.thing.id==t1.id # fails
  end
end
