# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#--Adminのseed設定--
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

#--Adminのseed設定ここまで--