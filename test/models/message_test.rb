require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'responds to name, email, subject and content' do
    msg = Message.new
    [:name, :email, :subject, :content].each do |attr|
      assert msg.respond_to? attr
    end
  end
  test 'should accept valid attributes' do
    valid_attrs = {
      name: 'josh ',
      email: 'josheche@gmail.com',
      subject: 'hi',
      content: 'you good?'
    }

    msg = Message.new valid_attrs

    assert msg.valid?
  end
end
