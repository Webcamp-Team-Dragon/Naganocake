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

# Customerのseed
Customer.create!(
  email: 'customer1@example.com',
  password: 'customer1',
  last_name: '顧客',
  first_name: '一号',
  last_name_kana: 'コキャク',
  first_name_kana: 'イチゴウ',
  postal_code: '0000000',
  telephone_number: '00000000000',
  address: 'サンプル県サンプル市サンプル島１丁目'
)

# ----------------------------------------------------------------------------------
# 動作確認のため下記追加しました。必要に応じてコメントアウトしてください！（田中）
# データベース内にあるseedのデータを削除する場合は、下記1)または2)を実行してください

# 1) rails db:resetを実行する
# 2)rails cを実行し、
# ・Item.delete_all
# ・Genre.delete_allの2つを実行する

# ジャンルのデータを作成
  genres = Genre.create([
  { name: 'ケーキ' },
  { name: '焼き菓子' },
  { name: 'プリン' },
  { name: 'キャンディ' }
])
# アイテムのデータを作成
  items = Item.create([
  { genre_id: genres[0].id, name: 'いちごのショートケーキ（ホール）', introduction: 'いちごのショートケーキです。(seeds.rb内記述)', price: 2500, is_active: true, image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/i_cake1.jpg"), filename: "i_cake1.jpg"), },
  { genre_id: genres[0].id, name: 'ガトーショコラ', introduction: 'ガトーショコラです。(seeds.rb内記述)', price: 2800, is_active: true, image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/i_cake2.jpg"), filename: "i_cake2.jpg"), },
  { genre_id: genres[1].id, name: 'クッキー', introduction: 'クッキーです。(seeds.rb内記述)', price: 800, is_active: true, image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/i_cookie1.jpg"), filename: "i_cookie1.jpg"), },
  { genre_id: genres[2].id, name: 'チョコプリン', introduction: 'チョコプリンです。(seeds.rb内記述)', price: 600, is_active: true, image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/i_pudding1.jpg"), filename: "i_pudding1.jpg"), },
  { genre_id: genres[3].id, name: '抹茶キャンディ', introduction: '抹茶のキャンディです(seeds.rb内記述)', price: 700, is_active: true, image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/i_candy1.png"), filename: "i_candy1.png"), },
  { genre_id: genres[0].id, name: 'チョコバナナミルフィーユ', introduction: 'チョコバナナミルフィーユです。(seeds.rb内記述)', price: 1100, is_active: true, image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/i_millefeuille1.png"), filename: "i_millefeuille1.png"), },
  { genre_id: genres[0].id, name: 'チーズタルト', introduction: 'チーズタルトです。(seeds.rb内記述)', price: 330, is_active: true, image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/i_cake3.jpg"), filename: "i_cake3.jpg"), },
])
# items_data.each do |item_data|
#   genre = Genre.find_by(name: item_data[:genre_name])

#   # アイテムがすでに存在するか確認。存在しない場合は新規作成、存在する場合は更新する形。
#   item = Item.find_or_initialize_by(name: item_data[:name], genre_id: genre.id)

#   # アイテムの属性を設定
#   item.introduction = item_data[:introduction]
#   item.price = item_data[:price]
#   item.is_active = true
#   item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/image_tag"), filename: "item.image") unless item.persisted?

#   if item.new_record? || item.changed?
#     item.save!
#     puts "Item '#{item.name}' created or updated!"
#   else
#     puts "Item '#{item.name}' already exists!"
#   end
# end

# puts "All items processed!"