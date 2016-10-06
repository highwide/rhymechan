# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ICON_PATH = Rails.root.join(*%w(app assets images messages))
messages = [
  {
    created_by: 'rhymechan',
    content: '感謝しよう、今ここでの出会い',
    icon: ICON_PATH.join('sample.png')
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
