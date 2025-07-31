require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without a name" do
    subject.name = ""
    expect(subject).not_to be_valid
  end

  it "is invalid without an email" do
    subject.email = ""
    expect(subject).not_to be_valid
  end

  it "is invalid when the name is too long" do
    subject.name = "a" * 51
    expect(subject).not_to be_valid
  end

  it "is invalid when the email is too long" do
    subject.email = "a" * 244 + "@example.com"
    expect(subject).not_to be_valid
  end

  it "accepts valid addresses" do
    valid_addresses = %w[
      user@example.com
      USER@foo.COM
      A_US-ER@foo.bar.org
      first.last@foo.jp
      alice+bob@baz.cn
    ]

    valid_addresses.each do |valid_address|
      subject.email = valid_address
      expect(subject).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end

  it "rejects invalid addresses" do
    invalid_addresses = %w[
      user@example,com
      user_at_foo.org
      user.name@example.
      foo@bar_baz.com
      foo@bar+baz.com
    ]

    invalid_addresses.each do |invalid_address|
      subject.email = invalid_address
      expect(subject).not_to be_valid, "#{invalid_address.inspect} should be invalid"
     end
  end

  it "is invalid when email is not unique" do
    subject.save
    duplicate_user = subject.dup
    expect(duplicate_user).not_to be_valid
  end
end
