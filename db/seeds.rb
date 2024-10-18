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
# --Adminのseed設定ここまで--

# ----------------------------------------------------------------------------------
# 動作確認のため下記追加しました。必要に応じてコメントアウトしてください！（田中）
# データベース内にあるseedのデータを削除する場合は、下記1)または2)を実行してください

# 1) rails db:resetを実行する
# 2)rails cを実行し、
# ・Item.delete_all
# ・Genre.delete_allの2つを実行する


# ジャンルのデータを作成（
genres = Genre.create([
  { name: 'ケーキ' },
  { name: '焼き菓子' },
  { name: 'プリン' },
  { name: 'キャンディ' }
])

# アイテムのデータを作成
items = Item.create([
  { genre_id: genres[0].id, name: 'いちごのショートケーキ（ホール）', introduction: 'いちごのショートケーキです。(seeds.rb内記述)', price: 2500, is_active: true },
  { genre_id: genres[0].id, name: 'ガトーショコラ', introduction: 'ガトーショコラです。(seeds.rb内記述)', price: 2800, is_active: true },
  { genre_id: genres[1].id, name: 'クッキー', introduction: 'クッキーです。(seeds.rb内記述)', price: 800, is_active: true },
  { genre_id: genres[2].id, name: 'チョコプリン', introduction: 'チョコプリンです。(seeds.rb内記述)', price: 600, is_active: true },
  { genre_id: genres[3].id, name: '抹茶キャンディ', introduction: '抹茶のキャンディです(seeds.rb内記述)', price: 700, is_active: true },
  { genre_id: genres[0].id, name: 'チョコバナナミルフィーユ', introduction: 'チョコバナナミルフィーユです。(seeds.rb内記述)', price: 1100, is_active: true },
  { genre_id: genres[0].id, name: 'チーズタルト', introduction: 'チーズタルトです。(seeds.rb内記述)', price: 330, is_active: true },
])
# -----------------------------------Genres、Itemsのseed追加ここまで----------------------------------