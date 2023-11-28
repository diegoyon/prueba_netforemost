class ArticlesController < ApplicationController
  require 'rest-client'

  def index
    create_articles if articles_empty
    
    render json: Article.all
  end

  private

  URL = 'https://newsapi.org/v2/everything?q=tesla&from=2023-10-28&sortBy=publishedAt&apiKey=9aebd269888c45afa25035e4166c2947&pageSize=20'

  def create_articles
    response = RestClient.get(URL)
    articles = JSON.parse(response).dig('articles')

    articles.each do |article|
      Article.create(
        author: article.dig('author'),
        title: article.dig('title'),
        image_url: article.dig('urlToImage'),
        published: article.dig('publishedAt'),
        content: article.dig('content') 
      )
    end
  end

  def articles_empty
    Article.all.empty?
  end
end
