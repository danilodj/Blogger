class ArticleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.new_article.subject
  #
  def new_article(article)
    @article = article
    @author = @article.author

    mail to: @author.email,
         subject: "New article"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.archived_article.subject
  #
  def archived_article(article)
    @article = article
    @author = @article.author

    mail to: @author.email,
         subject: "Your article has been archived"
  end
  
end
