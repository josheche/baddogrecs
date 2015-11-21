require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase

  test "message me" do
    msg = Message.new(
      name: 'baddogrecs',
      email: 'info@baddogrecs.com',
      subject: 'Hi',
      content: 'test'
    )

    email = MessageMailer.message_me(msg).deliver_now

    refute ActionMailer::Base.deliveries.empty?

    assert_equal ['josheche@gmail.com'], email.to
    assert_equal ['info@baddogrecs.com'], email.from
    assert_equal 'Hi', email.subject
    assert_equal 'test', email.body.to_s
  end
end
