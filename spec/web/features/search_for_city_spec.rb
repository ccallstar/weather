require 'features_helper'

describe 'Search for city' do

  it 'finds a unique city' do
    visit '/weather'

    within 'form#city-form' do
      fill_in 'city-name',  with: 'Detroit'

      click_button 'Check Temperature'
    end

    assert page.has_selector?('#temp')
  end

  it 'finds a duplicate city' do
    visit '/weather'

    within 'form#city-form' do
      fill_in 'city-name',  with: 'Portland'

      click_button 'Check Temperature'
    end

    assert page.has_content?('Duplicate cities found')
  end

  it 'finds no city' do
    visit '/weather'

    within 'form#city-form' do
      fill_in 'city-name',  with: 'adfadfafa'

      click_button 'Check Temperature'
    end

    assert page.has_content?('Failed to find city')
  end
end