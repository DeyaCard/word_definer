require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and goes to the words page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'Cat')
    click_on('Submit')
    expect(page).to have_content('Cat')
  end
end

describe('create an edit word path', {type => :feature}) do
  it('goes to the edit word page and changes a word') do
    word = Word.new("cat", nil)
    word.save
    visit("/words/#{word.id}/edit")
    fill_in('name', :with => 'Tiger')
    click_on('Update')
    expect(page).to have_content('Tiger')
  end
end

describe('create a delete word path', {:type => :feature}) do
  it('goes to the edit word page and then deletes a word') do
    Word.clear()
    word = Word.new("cat", nil)
    word.save
    word2 = Word.new("dog", nil)
    word2.save
    visit("/words/#{word.id}/edit")
    click_on('Delete')
    expect(page).to have_no_content('cat')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a definition of a word') do
    word = Word.new("cat", nil)
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'feline')
    click_on('Add definition')
    expect(page).to have_content('feline')
  end
end

describe('create an edit definition path', {:type => :feature}) do
  it('goes to the edit word page and changes a word') do
    Word.clear()
    word = Word.new("cat", nil)
    word.save
    definition = Definition.new("feline", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    fill_in("name", :with => 'sharp claws')
    click_on('Update definition')
    expect(page).to have_content('sharp claws')
  end
end

describe('create a delete definition path', {:type => :feature}) do
  it('goes to the edit definition page and then deletes a definition') do
    Word.clear()
    word = Word.new("cat", nil)
    word.save
    definition = Definition.new("feline", word.id, nil)
    definition.save()
    visit("/words/#{word.id}/definitions/#{definition.id}")
    click_on('Delete definition')
    expect(page).to have_no_content('feline')
  end
end
  