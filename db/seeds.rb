# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# --Adminのseed設定--
# すでに同じメールアドレスのAdminが存在しないか確認
admin = Admin.find_or_initialize_by(email: 'admin@example.com')

# Adminが新規作成される場合、パスワードを設定
admin.password = 'admin12'
admin.password_confirmation = 'admin12'

# 変更があった場合にのみ保存する
if admin.new_record? || admin.changed?
  admin.save!
  puts "Admin user created or updated!"
else
  puts "Admin user already exists!"
end
# --Adminのseed設定ここまで--

# ----------------------------------------------------------------------------------
# 動作確認のため下記追加しました。必要に応じてコメントアウトしてください！（田中）
# データベース内にあるseedのデータを削除する場合は、下記1)または2)を実行してください

# 1) rails db:resetを実行する
# 2)rails cを実行し、
# ・Item.delete_all
# ・Genre.delete_allの2つを実行する

# ジャンルのデータを作成
genres_data = [
  { name: 'ケーキ' },
  { name: '焼き菓子' },
  { name: 'プリン' },
  { name: 'キャンディ' }
]

genres_data.each do |genre_data|
  genre = Genre.find_or_create_by(name: genre_data[:name])  # find_or_create_byを使用して、ジャンルが存在しない場合のみ新しく作成します。
  puts "Genre '#{genre.name}' created or already exists!"
end

# アイテムのデータを作成
items_data = [
  { genre_name: 'ケーキ', name: 'いちごのショートケーキ（ホール）', introduction: 'いちごのショートケーキです。(seeds.rb内記述)', price: 2500 },
  { genre_name: 'ケーキ', name: 'ガトーショコラ', introduction: 'ガトーショコラです。(seeds.rb内記述)', price: 2800 },
  { genre_name: '焼き菓子', name: 'クッキー', introduction: 'クッキーです。(seeds.rb内記述)', price: 800 },
  { genre_name: 'プリン', name: 'チョコプリン', introduction: 'チョコプリンです。(seeds.rb内記述)', price: 600 },
  { genre_name: 'キャンディ', name: '抹茶キャンディ', introduction: '抹茶のキャンディです(seeds.rb内記述)', price: 700 },
  { genre_name: 'ケーキ', name: 'チョコバナナミルフィーユ', introduction: 'チョコバナナミルフィーユです。(seeds.rb内記述)', price: 1100 },
  { genre_name: 'ケーキ', name: 'チーズタルト', introduction: 'チーズタルトです。(seeds.rb内記述)', price: 330 }
]

items_data.each do |item_data|
  genre = Genre.find_by(name: item_data[:genre_name])

  # アイテムがすでに存在するか確認。存在しない場合は新規作成、存在する場合は更新する形。
  item = Item.find_or_initialize_by(name: item_data[:name], genre_id: genre.id)

  # アイテムの属性を設定
  item.introduction = item_data[:introduction]
  item.price = item_data[:price]
  item.is_active = true
  item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/sample.jpg"), filename: "sample.jpg") unless item.persisted?

  if item.new_record? || item.changed?
    item.save!
    puts "Item '#{item.name}' created or updated!"
  else
    puts "Item '#{item.name}' already exists!"
  end
end

puts "All items processed!"

# # カート内アイテムの作成　※customerの情報追加後に実施予定
# cart_items = CartItem.create([
#   { customer_id: 1, items_id: 1, amount: 2 },
#   { customer_id: 1, items_id: 2, amount: 1 },
#   { customer_id: 2, items_id: 3, amount: 4 },
#   { customer_id: 2, items_id: 1, amount: 1 }
# ])
# -----------------------------------Genres、Items、Cart_itemsのseed追加ここまで----------------------------------