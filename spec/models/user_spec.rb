# require 'rails_helper'
require 'rails/all'

RSpec.describe User, type: :model do

  let(:user) { User.create!(name: "Blocipedia User", email: "user@example.com", password: "password") }

  describe "attributes" do
    it "should respond to name" do
      expect(user).to respond_to(:name)
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "should respond to password" do
      expect(user).to respond_to(:password)
    end
  end


end
