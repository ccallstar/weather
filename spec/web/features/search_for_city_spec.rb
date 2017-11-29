require 'features_helper'

describe 'Search for city' do

  it 'finds a unique city' do
    visit '/weather'

    within 'form#city-form' do
      fill_in 'Name',  with: 'Detroit'

      click_button 'Check Temperature'
    end

    # current_path.must_equal('/weather/temperature')
    assert page.has_content?('The current temperature is')
  end

  it 'finds a duplicate city' do
    visit '/weather'

    within 'form#city-form' do
      fill_in 'Name',  with: 'Portland'

      click_button 'Check Temperature'
    end

    assert page.has_content?('Duplicate cities found')
  end

  it 'finds no city' do
    visit '/weather'

    within 'form#city-form' do
      fill_in 'Name',  with: 'adfadfafa'

      click_button 'Check Temperature'
    end

    assert page.has_content?('Failed to find city')
  end
end