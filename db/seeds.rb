# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
	id: 1,
	name: "田中太郎",
	company: "株式会社テスト",
	postcode: "1234567",
	address: "大阪市北区堂島3丁目",
	phonenumber: "09011111111",
	email: "tanaka@gmail.com",
	password: "111111",
	)

Category.create!(
	[
		{
			id: 1,
			name:"Webサイト作成・Webデザイン"
		},
		{
			id: 2,
			name: "広告"
		},

	])

Service.create!(
	[
		{
			user_id: 1,
			name:"ホームページ作成",
			price: 60000,
			category_id: 1,
			area: "全国",
			introduction: "おしゃれなホームページ作ります！"


		}
	])

