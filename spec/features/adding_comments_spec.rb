require 'rails_helper'

RSpec.feature "Adding comments to an article" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @article = Article.create(title: 'The first article', body: 'Lorem ipsum dolor sit amet, consectetur', user: @john)
    @comment = "An amazing article"
  end

  scenario "permits a signed in user to write a review" do
    login_as(@fred)

    visit root_path

    click_link @article.title
    fill_in "Your comment", with: @comment
    click_button "Add Comment"

    expect(page).to have_content("Comment has been created")
    expect(page).to have_content @comment
    expect(current_path).to eq(article_path(@article.id))
  end
end
