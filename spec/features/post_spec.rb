require 'rails_helper'

describe 'new post' do 
    it 'ensures the form route works with the /new action' do 
        visit new_post_path
        expect(page.status_code).to eq(200)
    end 

    it 'renders HTML in the /new template' do 
        visit new_post_path
        expect(page).to have_content('Post Form')
    end
    
    it 'displays a new post form that redirects to the index page, which then contains the submitted posts title and description' do 
        visit new_post_path
        fill_in 'post_title', with: "My Name Is Werner Brandes"
        fill_in 'post_description', with: "My voice is my passport, verify me."
        click_on 'Submit Post'

        expect(page.current_path).to eq(posts_path)
        expect(page).to have_content("My Name Is Werner Brandes")
        expect(page).to have_content("My voice is my passport, verify me.")
    end 
end 