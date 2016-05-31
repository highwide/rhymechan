namespace :index do
  desc "elasticsearchにはてなキーワードをつっこむ"
  task hatena: :environment do
    indexer = Indexer.new
    indexer.run
  end
end
