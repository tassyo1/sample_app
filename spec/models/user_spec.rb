require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.new(name: "Example name", email: "user@example.com",
                     password:   "foobar", password_confirmation: "foobar") }

  describe "Validações" do
   it { should validate_presence_of(:name) } 
   it { should validate_presence_of(:email) }
  end

end
