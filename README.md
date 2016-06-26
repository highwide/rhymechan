# rhyby
Japanese rhyme from Ruby

# require
elasticsearch
nkf
mecab

# how to

Elasticsearch should be running for rhyby to work.

```
% curl http://d.hatena.ne.jp/images/keyword/keywordlist_furigana.csv > vendor/keywords/keywordlist_furigana.csv
% nkf -w vendor/keywords/keywordlist_furigana.csv > vendor/keywords/keywordlist_furigana_utf8.csv
% bin/rake index:hatena
% bin/rails s
```
