# Rhymechan

Rhymechan was formerly known as Rhyby.

## require

elasticsearch
nkf
mecab

## how to

Elasticsearch should be running for rhymechan to work.

```
% curl http://d.hatena.ne.jp/images/keyword/keywordlist_furigana.csv > vendor/keywords/keywordlist_furigana.csv
% nkf -w vendor/keywords/keywordlist_furigana.csv > vendor/keywords/keywordlist_furigana_utf8.csv
% bin/rake index:hatena
% bin/rails s
```

## Deployment via Docker Compose

```
$ docker-compose up
# Create Elasticsearch index
$ docker exec -it rhymechan_rails_1 bin/rake index:hatena
```

You still need to set some environment variables. See `secrets.env.example` for further details.
