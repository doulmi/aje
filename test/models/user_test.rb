require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
        name: 'Example User',
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password'
    )
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = '  '
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test "email should be resent" do
    @user.email = ' '
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = 'a' * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email should be an valid email format" do
    valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foot.jp alice+bob@baz.cn]
    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?, "#{email.inspect
      } should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_email = %w[user@example,com user@exmaple...com user_at_foo.org user.name@exmaple.foo@bar_baz.comi foo@bar+baz.com]
    invalid_email.each do |email|
      @user.email = email
      assert_not @user.valid?, "#{email.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?

    duplicate_user.email = duplicate_user.email.upcase
    assert duplicate_user.valid?
  end

  test "email should be saved as lowercase" do
    origin_email = @user.email
    @user.email = @user.email.upcase
    @user.save
    assert @user.reload.email === origin_email
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test "password should have minimum length" do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test "password and password confirmation should be same" do
    @user.password_confirmation += "_random"
    assert_not @user.valid?
  end
end
