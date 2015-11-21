require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  test "succesful post" do
    assert_difference 'ActionMailer::Base.deliveries.size', 1 do
      post :create, message: {
        name: 'baddogrecs',
        email: 'info@baddogrecs.com',
        subject: 'hi',
        content: 'test'
      }
    end

    assert_redirected_to new_message_path
    last_email = ActionMailer::Base.deliveries.last

    assert_equal "hi", last_email.subject
    assert_equal 'josheche@gmail.com', last_email.to[0]
    assert_equal 'info@baddogrecs.com', last_email.from[0]
    assert_match(/test/, last_email.body.to_s)

    ActionMailer::Base.deliveries.clear
    end
  test "failed post" do
  post :create, message: {\
    name: '',
    email: '',
    subject: '',
    content: ''
  }

    [:name, :email, :subject, :content].each do |attr|
    assert_select 'li', "#{attr.capitalize} can't be blank"
    end
  end
end
