# ホーム画面へ遷移
crumb :root do
  link "メルカリ", root_path
end

# カテゴリー一覧へ遷移
crumb :category_all do
  link "カテゴリー一覧", categories_path
  parent :root
end

# 親カテゴリーが選択された場合
crumb :parent_categories do |category|
  link category, category_path
  parent :category_all
end

# 子カテゴリーが選択された場合
crumb :child_categories do |category|
  link category.parent.value, category_path(category.parent.id)
  link category.value, category_path(category.id)
  parent :category_all
end

# 孫カテゴリーが選択された場合 
crumb :grand_child_categories do |category|
  link category.parent.parent.value, category_path(category.parent.parent.id)
  link category.parent.value, category_path(category.parent.id)
  link category.value, category_path(category.id)
  parent :category_all
end

# ブランド一覧へ遷移
crumb :brand_all do
  link "ブランド一覧", brand_group_path(1)
  parent :root
end

# ブランドが選択された場合
crumb :select_brand do |brand|
  link brand.name
  parent :brand_all
end

# 選択したブランドのカテゴリーが選択された場合
crumb :select_brand_category do |brand, category|
  link brand.name, brand_path(brand.id)
  link category.value
  parent :brand_all
end