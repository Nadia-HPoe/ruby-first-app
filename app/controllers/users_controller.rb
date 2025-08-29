class UsersController < ApplicationController
  def index
    @users = [User.new(
      id: 1,
      name: 'John',
      username: 'JohnXXX',
      avatar_url: 'https://masterpiecer-images.s3.yandex.net/d960d0ee6f5811ee886e3a7ca4cc1bdc:upscaled'

    ),
    User.new(
      id: 2,
      name: 'Lily',
      username: 'lilflower',
      avatar_url: 'https://img.freepik.com/free-vector/hand-drawn-anime-kawaii-illustration_52683-123747.jpg?semt=ais_hybrid&w=740&q=80'

    ),
    User.new(
      id: 3,
      name: 'Nate',
      username: 'catsnake',
      avatar_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ7TBSGntVkvJHcJTnWIgtrk3Zs0nvWvXvmQ&s'

    )]

  end

  def new
  end

  def edit
  end

  

  def show
    @user = User.new(
      id: 1,
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
