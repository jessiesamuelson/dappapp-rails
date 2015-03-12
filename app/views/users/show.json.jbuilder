json.extract! @user, :id, :email, :name, :username, :created_at, :updated_at
json.url user_path(@user)
