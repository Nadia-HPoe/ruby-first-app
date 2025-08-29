class UserController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'John',
      username: 'JohnXXX',
      avatar_url: 'https://masterpiecer-images.s3.yandex.net/d960d0ee6f5811ee886e3a7ca4cc1bdc:upscaled'

    )
    @questions = [
      Question.new(text: 'How are you?', created_at: Date.parse('27.03.2024')),
      Question.new(text: 'What is your favourite food?', created_at: Date.parse('30.03.2024'))
    ]
    @new_question = Question.new
  end
end
