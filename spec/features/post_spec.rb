require 'rails_helper'

# Standard RESTful convention of new_post_path:
describe 'new post' do
  it 'ensures that the form route works with the /new action' do
    visit new_post_path
    expect(page.status_code).to eq(200)
  end

  it 'renders HTML in the /new template' do
    visit new_post_path
    expect(page).to have_content('Post Form')
  end

  it "displays a new post form that redirects to the index page, which then contains the submitted post's title and description" do
    visit new_post_path
    fill_in 'post_title', with: 'My post title'
    fill_in 'post_description', with: 'My post description'

    click_on 'Submit Post'

    expect(page.current_path).to eq(posts_path)
    expect(page).to have_content('My post title')
    expect(page).to have_content('My post description')
  end
end



# Steps:
# Giving the user ability to create a new post
# Capybara spec posts/new
# Create new_post_path method in routes.rb: resources :posts, only: [:index, :new]
# Add new action to PostsController
# Create posts new.html.erb in views
# Add a matcher spec to ensure the template is displaying HTML on new post page
# Add some html to the new.html.erb file: <h3>Post Form</h3>
# Build the form in HTML, write a spec for it
# Add HTML to the view template
# Draw a create route
# Terminal: rake routes: column
# CSRF: One site making a request to another site via a form is the general flow of a Cross-Site Request Forgery. Rails blocks this from happening by default by requiring that a unique authenticity token be submitted with each form.
# The form_tag Rails helper is smart enough to know that we want to submit the form via the POST method, and it automatically renders the HTML that we were writing by hand before. The form_tag method also automatically generates the necessary authenticity token, so we can remove the now-redundant hidden_field_tag.
# ActionView, a sub-gem of Rails, provides a number of helper methods to assist with streamlining view template code. Specifically, we can use ActionView methods to improve our form! Let's start by integrating a Rails form_tag element:
