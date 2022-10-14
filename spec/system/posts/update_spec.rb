
require 'rails_helper'

RSpec.describe 'update a post', type: :system do
  before(:each) do
    @user1 = User.create(:username => "Andrew", :email => "achalkley@example.com") 
    @user2 = User.create(:username => "Matt", :email => "mtardivo@example.com") 

    @post = Post.create(:user => @user1, :title => "My Blog Post", :body => "Hello world!\n\nThis is my first blog post.")
  end

  scenario 'edit author' do
  ###TODO: complete this scenario 100% controller coverage
  ###Ability to change the author from Andrew to Matt

  end

  ###TODO: complete this spec 100% controller coverage

  
end
