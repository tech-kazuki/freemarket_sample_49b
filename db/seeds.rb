mens = Category.create(name: "レディース")

mens_tops = mens.children.create(name: "トップス")
mens_pants = mens.children.create(name: "パンツ")

mens_tops.children.create([{name: "ポロシャツ"}, {name: "キャミソール"}])
mens_pants.children.create([{name: "デニム/ジーンズ"}, {name: "ショートパンツ"}])
mens = Category.create(name: "メンズ")

mens_tops = mens.children.create(name: "トップス")
mens_pants = mens.children.create(name: "パンツ")

mens_tops.children.create([{name: "シャツ"}, {name: "ポロシャツ"}])
mens_pants.children.create([{name: "スラックス"}, {name: "チノパン"}])