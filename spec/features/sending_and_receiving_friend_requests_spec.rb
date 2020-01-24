RSpec.feature "Friend Requests", type: :feature do

  let(:userA) { create(:user, :username => "TestA", :email => "testa@example.com", :password => "pass12A", :id => 1) }
  let(:userB) { create(:user, :username => "TestB", :email => "testb@example.com", :password => "pass12B", :id => 2) }
  let(:userC) { create(:user, :username => "TestC", :email => "testc@example.com", :password => "pass12C", :id => 3) }

  scenario "User can send a friend request that is then accepted" do
    userA
    userB
    userC
    sign_in("testa@example.com", "pass12A")
    expect(page).to have_content("TestA")
    click_link "Friend List"
    
    find('a', id: "add_friend_user2").click
    expect(page).to have_content("Cancel Request")

    click_link "Sign out"
    sign_in("testb@example.com", "pass12B")

    click_link "Friend List"
    find('a', id: "friend-request-btn").click

    expect(page).to have_content("TestA")
    click_link "Accept"

    click_link "My Profile"
    click_link "Friend List"

    expect(page).to have_css("div.friend")
    within(".friends") do
      expect(page).to have_content("TestA")
    end

    click_link "Sign out"
    sign_in("testa@example.com", "pass12A")
    click_link "Friend List"

    expect(page).to have_css("div.friend")
    within(".friends") do
      expect(page).to have_content("TestB")
    end
  end

  scenario "User can send a friend request that is then declined" do
    userA
    userB
    userC
    sign_in("testa@example.com", "pass12A")
    expect(page).to have_content("TestA")
    click_link "Friend List"
    
    find('a', id: "add_friend_user2").click
    expect(page).to have_content("Cancel Request")

    click_link "Sign out"
    sign_in("testb@example.com", "pass12B")

    click_link "Friend List"
    find('a', id: "friend-request-btn").click

    expect(page).to have_content("TestA")
    click_link "Decline"

    click_link "My Profile"
    click_link "Friend List"

    expect(page).to have_no_css("div.friend")
    within(".non-friends") do
      expect(page).to have_content("TestA")
    end

    click_link "Sign out"
    sign_in("testa@example.com", "pass12A")
    click_link "Friend List"

    expect(page).to have_no_css("div.friend")
    within(".non-friends") do
      expect(page).to have_content("TestB")
    end
  end
end
