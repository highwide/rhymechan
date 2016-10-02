# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ICON_PATH = %W(#{Rails.root} app assets images messages).join(File::SEPARATOR)
messages = [
  {
    created_by: 'rhymechan',
    content: '感謝しよう、今ここでの出会い',
    icon: File.open(%W(#{ICON_PATH} sample.png).join(File::SEPARATOR))
  }
]

Message.first_or_create(messages)
