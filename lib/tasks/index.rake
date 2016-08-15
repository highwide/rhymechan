namespace :index do
  desc 'elasticsearchにはてなキーワードをつっこむ'
  task hatena: :environment do
    keywords_file = Rails.root.join(
      *%w(vendor keywords keywordlist_furigana_utf8.csv)
    ).to_s
    indexer = Indexer.new(keywords_file)
    indexer.run
  end
end
