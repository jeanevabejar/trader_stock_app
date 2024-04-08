require "test_helper"

class ApprovedMailerTest < ActionMailer::TestCase
  test "is_approved" do
    mail = ApprovedMailer.is_approved
    assert_equal "Is approved", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
