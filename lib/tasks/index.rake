namespace :index do
  desc 'はてなキーワードをダウンロードしてファイルに保存する'
  task get_keywords: :environment do
    open('http://d.hatena.ne.jp/images/keyword/keywordlist_furigana.csv') do |source|
      keywords_file = Rails.root.join(
        *%w(vendor keywords keywordlist_furigana_utf8.csv)
      ).to_s
      open(keywords_file, 'w') do |file|
        file.write(source.read.encode(Encoding::UTF_8, Encoding::EUCJP_MS))
      end
    end
  end

  desc 'elasticsearchにはてなキーワードをつっこむ'
  task create: :environment do
    keywords_file = Rails.root.join(
      *%w(vendor keywords keywordlist_furigana_utf8.csv)
    ).to_s
    indexer = Indexer.new(keywords_file)
    indexer.run
  end
end
