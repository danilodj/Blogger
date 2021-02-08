# Preview all emails at http://localhost:3000/rails/mailers/article_mailer
class ArticleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/article_mailer/new_article
  def new_article
  	article = Article.last
    ArticleMailer.new_article(article)
  end

  # Preview this email at http://localhost:3000/rails/mailers/article_mailer/archived_article
  def archived_article
  	article = Article.last
    ArticleMailer.archived_article(article)
  end

end
