require 'rails_helper'

describe "new post" do
    it "ensures that the form route works with the /new action" do
        visit new_post_path
        expect(page.status_code).to eq(200)
    end

    it "renders HTML in the /new template" do
        visit new_post_path
        expect(page).to have_content("Post Form")
    end

    it "displays a new post" do
        visit new_post_path
        
        # expect(page).to have_css("form", id: "new_post_form")
        expect(page).to have_css("input", id: "post_title")
        expect(page).to have_css("textarea", id: "post_description")
    end

    it "new post form redirects to the index page, which then contains the submitted post's title and description" do
        visit new_post_path

        fill_in "post_title", with: "My Post Title"
        fill_in "post_description", with: "My post description"
        click_on "Submit Post"

        expect(page.current_path).to eq("/posts")
        expect(page).to have_content("My Post Title")
        expect(page).to have_content("My post description")
    end

end

