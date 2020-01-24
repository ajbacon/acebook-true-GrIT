FactoryBot.define do
  factory :friend_request do
    user_id { 1 }
    pending_friend_id { 1 }
  end
end
