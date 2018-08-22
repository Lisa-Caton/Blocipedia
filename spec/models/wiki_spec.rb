# require 'rails_helper'
require 'rails/all'

RSpec.describe Wiki, type: :model do

  let(:user) { User.create!(name: "Blocipedia User", email: "abc@example.com", password: "password") }
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", user: user) }

  describe "attributes" do
    it "should respond to title attribute" do
      expect(wiki).to respond_to(:title)
    end

    it "should respond to body attribute" do
      expect(wiki).to respond_to(:body)
    end
  end

end
