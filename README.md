# Rhymechan

_Formerly known as Rhyby._

Rhymechan helps u 2 konvert ill messagez in2 da dope rhyme and flow with vibez of da new $hit.

## Prerequisite

- Elasticsearch
- mecab
- mecab-ipadic
- nkf

## Usage

Elasticsearch must be running for Rhymechan to work.

Get Hatena keyword list.

```
$ curl http://d.hatena.ne.jp/images/keyword/keywordlist_furigana.csv > vendor/keywords/keywordlist_furigana.csv
```

Convert the encoding of the list to UTF-8.


```
$ nkf -w vendor/keywords/keywordlist_furigana.csv > vendor/keywords/keywordlist_furigana_utf8.csv
```

Then create Elasticsearch index (it takes a while) .

```
$ bin/rails index:hatena
```

Now you are all set. Let's start Rails server.

```
$ bin/rails s
```

## Deployment via Docker Compose

```
$ docker-compose up

# Run migration
$ docker-compose run rails bin/rails db:migrate

# Create Elasticsearch index
$ docker-compose run rails bin/rails index:hatena
```

You still need to set some environment variables. See `secrets.env.example` for further details.
