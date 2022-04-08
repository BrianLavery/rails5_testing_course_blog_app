require 'rails_helper'

RSpec.feature 'Creating Articles' do
  before do
    @article = Article.create(title: 'The first article', body: 'Lorem ipsum dolor sit amet, consectetur')
  end

  scenario 'A user displays an article' do
    visit root_path
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end
