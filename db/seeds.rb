# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ICON_PATH = Rails.root.join(*%w(db seeds images))
messages = [
  {
    created_by: 'upinetree',
    content: 'うっちー、おめでとう！この前電車で会ってびっくりしました。また飲みながら近況とか話しましょう。末永くお幸せに！',
    icon: ICON_PATH.join('upinetree.png')
  },
  {
    created_by: 'suzuki86 - the rhymer author',
    content: 'ご結婚おめでとうございます！偶然、同じ時期にラップを絡めたツールを作ったのはもはやブラザーと言えるかもしれません。ヴァイブスの高いご家庭になること間違いなしですね！末永くお幸せに！',
    icon: ICON_PATH.join('suzuki86.png')
  },
  {
    created_by: 'bonbon0605',
    content: '夫婦の工夫、幸福の夫婦。写真家に感謝し、つまみの品は友と話飲み待つ。私お祝いしたわ。回文でした。おめでとう！！',
    icon: ICON_PATH.join('bonbon0605.png')
  },
  {
    created_by: 'yuki3738',
    content: 'うっちーおめでとう！またbeerに行きましょう！末永くお幸せに〜！',
    icon: ICON_PATH.join('yuki3738.png')
  },
  {
    created_by: 'iosiftakakura',
    content: 'うっちーさん、おめでとうございます。この幸せが永遠に続くことをお祈りしております。',
    icon: ICON_PATH.join('iosiftakakura.png')
  },
  {
    created_by: 'ohtsuka',
    content: 'どうも、ドアラッパー大塚です。ケミストリー風に決めてみました。この度はおめでとうございます！',
    icon: ICON_PATH.join('ohtsuka.png')
  },
  {
    created_by: 'katorie',
    content: '結婚生活どうですか。楽しいですか。そうですか。末長くお幸せになりやがれ、このやろー！',
    icon: ICON_PATH.join('katorie.png')
  },
  {
    created_by: 'ta1kt0me',
    content: '共にプログラミング人生を歩めるうっちーに出会えたことに感謝。結婚おめでと！最高の家族と、素敵な人生を！',
    icon: ICON_PATH.join('ta1kt0me.png')
  },
  {
    created_by: 'akinomaeni',
    content: 'とてもいい日に結婚していて羨ましいです！おめでとうございます！ずっと仲良くお幸せに！',
    icon: ICON_PATH.join('akinomaeni.png')
  },
  {
    created_by: '5t111111',
    content: '内山さん、おめでとうおおおおおお！',
    icon: ICON_PATH.join('5t111111.png')
  },
  {
    created_by: 'gch0929',
    content: 'うっちーさんご結婚おめでとうございます！うっちーさんのことは勝手にライバルだと思っているので、これからも切磋琢磨していきましょう！',
    icon: ICON_PATH.join('gch0929.png')
  },
  {
    created_by: 'maruchan',
    content: 'うっちーさん、RESTful勉強会で初めてお会いした時に、私によちよち.rbを紹介してくれてありがとうございました！うっちーさんの言葉がなかったら、ここの素晴らしい仲間に出会えてなかったかも知れません。ご結婚おめでとうございます！',
    icon: ICON_PATH.join('maruchan.png')
  },
  {
    created_by: 'pupupopo88',
    content: 'うっちーさんご結婚おめでとうございます！更にhighでwideなLifeになっちゃいますね！うらやましいなっ！！',
    icon: ICON_PATH.join('pupupopo88.png')
  },
  {
    created_by: 'kitamuu',
    content: 'うっちー結婚おめでとう！ワッツアップ！メーン！いつまでも笑顔の絶えない家庭を築いていってね',
    icon: ICON_PATH.join('kitamuu.png')
  },
  {
    created_by: 'gaku',
    content: 'うっちーさんご結婚おめでとうございます、いつまでもこの日を忘れずに長い人生を共に助け合って楽しい家庭を築いてください',
    icon: ICON_PATH.join('gaku.png')
  },
  {
    created_by: 'takkii',
    content: 'うっちーさんご結婚おめでとうございます。highwideとbrideの二人のハイムで期待してるぜ末長く愛をライム。',
    icon: ICON_PATH.join('takkii.png')
  },
  {
    created_by: 'ikatsuki',
    content: 'うっちーさん！結婚おめでとうです！気さくで、愉快で、知的なうっちーさんは憧れざる得ない人でした！素敵な相棒と素敵な人生を歩んでください！',
    icon: ICON_PATH.join('ikatsuki.png')
  },
  {
    created_by: 'odailly',
    content: '結婚おめでとう！皆からのお祝いメッセージが殺到！幸せな二人の関係はまるで熱湯！そんな姿を見て僕はちょっと嫉妬！',
    icon: ICON_PATH.join('odailly.png')
  },
  {
    created_by: 'shokola',
    content: 'ウッチー、ハッピー、みんなスキッ！',
    icon: ICON_PATH.join('shokola.png')
  },
  {
    created_by: 'yucao24hours - yochiyochirb organizer',
    content: 'コミュニティ主催者として、ウッチーさんの気配りと積極的な姿勢に何度救われ、何度学ばせてもらったかわかりません。ウッチーさんらしさをいっぱいに出して、すてきなご家庭を築いてください！おめでとうございます！',
    icon: ICON_PATH.join('yucao24hours.png')
  }
]

messages.each do |message|
  m = Message.find_or_initialize_by(created_by: message[:created_by], content: message[:content])
  next unless m.new_record?
  open(message[:icon]) { |f|
    m.icon = f
    m.save!
  }
end
