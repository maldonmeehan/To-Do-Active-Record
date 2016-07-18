require('spec_helper.rb')
require('capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('display index', {:type => :feature}) do
  it('show links for adding a new list and viewing all lists') do
    visit('/')
    click_link('Add a new list')
    expect(page).to have_content('Name your To do list:')
  end
end

describe('viewing the lists', {:type => :feature}) do
  it('allows us to view our lists') do
    visit('/')
    click_link('View all added/saved lists')
    expect(page).to have_content('Your current to-do lists')
  end
end

describe('adding a new task to our list', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    visit('/lists/new')
    fill_in('list_name', :with =>'Store')
    click_button('Submit')
    click_link('View all added/saved lists')
    click_link('Store')
    fill_in('description', :with => 'milk')
    click_button('Add task')
    expect(page).to have_content('Your changes have been saved!!')
  end
end
