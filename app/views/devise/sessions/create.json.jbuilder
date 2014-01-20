json.user do |user_json|
  user_json.id        @user.id
  user_json.email     @user.email
  user_json.api_key   @user.api_key
  user_json.nickname  @user.nickname
end