for i in 1..100
  @user = User.new
  p @user
  id = i
  p id
  e_mail = Faker::Internet.safe_email
  p e_mail
  @user.user_id = id
  @user.email = e_mail
  @user.password = Faker::Internet.password
  if @user.save
  p "User #{@user.user_id} has registered with the email #{@user.email} and the password #{@user.password}"
  else
    p @user.errors
    end
  @article = Article.new
  @article.user_id = id
  @article.title = "Will #{Faker::Company.name} really #{Faker::Company.bs}?"
  paragraph_1 = Faker::Lorem.paragraphs.join(' ')
  paragraph_2 = Faker::Books::Lovecraft.paragraphs.join(' ')
  paragraph_3 = Faker::Hipster.paragraphs.join(' ')
  @article.content = "#{paragraph_1} <br /> #{paragraph_2} <br /> #{paragraph_3}"
  if @article.save
    p "#{@article.title} has been saved"
    for ii in 1..10
      @comment = Comment.new
      @comment.user_id = id
      @comment.article = @article
      @comment.message = Faker::Hacker.say_something_smart
      if @comment.save
        p "Comment #{ii} has been saved for article #{@article.title} written by #{@user.user_id}"
      else
        p @comment.errors
      end
    end
  else
    p @article.errors
  end
end
