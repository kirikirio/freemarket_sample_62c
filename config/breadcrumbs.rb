# ルート
crumb :root do
  link "メルカリ", "/"
end

# マイページ
crumb :users_show do
  link "マイページ",  "/users/:id"
  parent :root
end

# ログアウト
crumb :users_logout do
  link "ログアウト"
  parent :users_show
end

# 本人情報の登録
crumb :addresses_edit do
  link "本人情報の登録"
  parent :users_show
end

# 支払い方法 クレジット登録
crumb :credits_index do
  link "支払い方法"
  parent :users_show
end

# プロフィール編集
crumb :users_profile do
  link "プロフィール"
  parent :users_show
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).