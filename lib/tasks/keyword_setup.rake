require 'nkf'

desc 'Get Hatena keyword list'
task :get_keywords do
  open('http://d.hatena.ne.jp/images/keyword/keywordlist_furigana.csv') do |source|
    open('vendor/keywords/keywordlist_furigana.csv', 'w') do |file|
      file.write(NKF.nkf('--ic=eucJP-ms --oc=UTF-8', open(source).read))
    end
  end
end
