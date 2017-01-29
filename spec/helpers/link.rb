module AddLink
  def add_link_single_tag
    visit '/links'
    click_button('Add Link')
    fill_in(:title, with: 'Facebook')
    fill_in(:url, with: 'www.facebook.com')
    fill_in(:tag, with: 'social')
    click_button('Save')
  end

  def add_link_multiple_tags
    visit '/links/new'
    fill_in(:title, with: 'Facebook')
    fill_in(:url, with: 'www.facebook.com')
    fill_in(:tag, with: 'social bubbles')
    click_button('Save')
  end
end
