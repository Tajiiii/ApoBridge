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
			id:2,
			name: "システム開発"
		},
		{
			id: 3,
			name: "広告"
		},
		{
			id: 4,
			name:"イベント・集客・Webマーケティング"
		},
		{
			id: 5,
			name: "コンサルティング"
		},
		{
			id: 6,
			name: "不動産"
		},
		{
			id: 7,
			name: "金融"
		},

		{
			id: 8,
			name:"保険"
		},
		{
			id:9,
			name:"教育サービス"
		},
		{
			id: 10,
			name: "人材"
		},

		{
			id: 11,
			name: "士業（行政書士・税理士etc.）"
		},
		{
			id: 12,
			name: "旅行"
		},
		{
			id: 13,
			name:"その他"
		}

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

