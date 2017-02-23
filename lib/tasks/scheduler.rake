desc 'This task is call by heroku schedual add on'
task :update => :environment do
  Article.get_life_news
  Article.get_start_news
  Article.get_beauty_news
end