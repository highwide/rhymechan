# rhyby
Japanese rhyme from Ruby

# require
elasticsearch

# how to

```
% curl http://d.hatena.ne.jp/images/keyword/keywordlist_furigana.csv > lib/assets/keywordlist_furigana.csv
% nkf -w lib/assets/keywordlist_furigana.csv > lib/assets/keywordlist_furigana_utf8.csv
% elasticsearch
% bin/rake index:hatena
% bin/rails s
```

