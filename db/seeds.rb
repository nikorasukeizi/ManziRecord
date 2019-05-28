# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Genre.create!(name: "J-POP")
Genre.create!(name: "ROCK")
Genre.create!(name: "K-POP")
Genre.create!(name: "アニソン")
Genre.create!(name: "洋楽")

Artist.create!(name: "マキシマム ザ ホルモン", rubi_name: "まきしまむざほるもん")
Artist.create!(name: "10-FEET", rubi_name: "てんふぃーと")
Artist.create!(name: "BUMP OF CHICKEN", rubi_name: "ばんぷおぶちきん")
Artist.create!(name: "THE ORAL CIGARETTES", rubi_name: "じおーらるしがれっつ")
Artist.create!(name: "ヤバいTシャツ屋さん", rubi_name: "やばいてぃーしゃつやさん")
Artist.create!(name: "打首獄門同好会", rubi_name: "うちくびごくもんどうこうかい")
Artist.create!(name: "米津玄師", rubi_name: "よねづけんし")
Artist.create!(name: "氷川きよし", rubi_name: "ひかわきよし")
Artist.create!(name: "ゴールデンボンバー", rubi_name: "ごーるでんぼんばー")
Artist.create!(name: "BACK STREET BOYS", rubi_name: "ばっくすとりーとぼーいず")
Artist.create!(name: "和田光司", rubi_name: "わだこうじ")
Artist.create!(name: "TWICE", rubi_name: "とぅわいす")
Artist.create!(name: "KARA", rubi_name: "から")
Artist.create!(name: "マジ卍なやつら", rubi_name: "まじまんじなやつら")

Label.create!(name: "ユニバーサルミュージック", rubi_name: "ゆにばーさるみゅーじっく")
Label.create!(name: "ワーナーミュージック・ジャパン", rubi_name: "わーなーみゅーじっくじゃぱん")
Label.create!(name: "ソニー・ミュージックエンタテインメント", rubi_name: "そにーみゅーじっくえんたていんめんと")
Label.create!(name: "キングレコード", rubi_name: "きんぐれこーど")
Label.create!(name: "ユーキャン・エンタテインメント", rubi_name: "ゆーきゃんえんたていんめんと")
Label.create!(name: "バップ", rubi_name: "ばっぷ")
Label.create!(name: "アップフロントグループ", rubi_name: "あっぷふろんとぐるーぷ")

