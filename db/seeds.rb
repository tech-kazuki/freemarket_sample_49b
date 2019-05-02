ladys = Category.create(name: "レディース")

ladys_tops = ladys.children.create(name: "トップス")
ladys_pants = ladys.children.create(name: "パンツ")

ladys_tops.children.create([{name: "ポロシャツ"}, {name: "キャミソール"}])
ladys_pants.children.create([{name: "デニム/ジーンズ"}, {name: "ショートパンツ"}])

mens = Category.create(name: "メンズ")

mens_tops = mens.children.create(name: "トップス")
mens_pants = mens.children.create(name: "パンツ")

mens_tops.children.create([{name: "シャツ"}, {name: "ポロシャツ"}])
mens_pants.children.create([{name: "スラックス"}, {name: "チノパン"}])
