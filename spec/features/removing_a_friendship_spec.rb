RSpec.feature "Friend Requests", type: :feature do

  let(:userA) { create(:user, :username => "TestA", :email => "testa@example.com", :password => "pass12A", :id => 1) }
  let(:userB) { create(:user, :username => "TestB", :email => "testb@example.com", :password => "pass12B", :id => 2) }

  let(:friendship1) { create(:friendship, :user_id => 1, :friend_id => 2) }


  scenario "User can send a friend request that is then accepted" do
    userA
    userB
    friendship1

    sign_in("testa@example.com", "pass12A")
    expect(page).to have_content("TestA")
    click_link "Friend List"

    within(".friends") do
      expect(page).to have_content("TestB")
      find('a', text: "Remove").click
    end

    within(".non-friends") do
      expect(page).to have_content("TestB")
    end
  end
end
