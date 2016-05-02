require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.new(name: "Example name", email: "user@example.com",
                     password:   "foobar", password_confirmation: "foobar") }

  describe "validações" do
   it { should validate_presence_of(:name) } 
   it { should validate_presence_of(:email) }
   it { should validate_length_of(:name)}
   it { should validate_length_of(:name).is_at_most(50)}
   it { should validate_length_of(:email).is_at_most(255)}
  end

  context 'formato de email' do
    it 'emails com formatos inválidos' do
      should_not allow_values('foo@bar..com','user@example,com',
                                 'user_at_foo.org','user.name@example.',
                                 ' foo@bar_baz.com','foo@bar+baz.com').for(:email)
    end

    it 'email deve ser único' do should validate_uniqueness_of(:email).case_insensitive 
    end

    it 'email deve salvar lower-case' do
      email_caixa_alta = "FOO@EXAMPLE.COM"
      subject.email = email_caixa_alta
      subject.save
      expect(subject.reload.email).to eq(email_caixa_alta.downcase)
    end

  end

  context 'formato do password' do
    it 'password não pode estar em branco' do
      subject.password = subject.password_confirmation = " " * 6
      expect(subject).not_to be_valid
    end

    it 'password deve ter um tamanho mínimo' do
      subject.password = subject.password_confirmation = "a" *5
      expect(subject).not_to be_valid
    end
  end
end


