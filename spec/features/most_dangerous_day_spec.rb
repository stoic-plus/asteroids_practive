require 'rails_helper'

describe 'Most Dangerous Day' do
  context 'as a guest user visiting root' do
    context 'entering date range and clicking \'Most Dangerous Day\'' do
      before :each do
        visit root_path

        fill_in :start_date, with: "2018-01-01"
        fill_in :end_date, with: "2018-01-07"
        click_button "Determine Most Dangerous Day"
      end

      it 'routes to /most_dangerous_day' do
        expect(current_path).to eq(most_dangerous_day_path)
      end

      it "shows heading 'Most Dangerous Day' and the day" do
        expect(page).to have_content("Most Dangerous Day")
        expect(page).to have_content("Most dangerous: January 1, 2018")
      end

      it 'shows entered date range' do
        expect(page).to have_content("January 1, 2018 - January 7, 2018")
      end

      xit 'shows 3 asteroids' do
        expect(page).to have_content("Name: (2014 KT76)")
        expect(page).to have_content("NEO Reference ID: 3672906")

        expect(page).to have_content("Name: (2001 LD)")
        expect(page).to have_content("NEO Reference ID: 3078262")

        expect(page).to have_content("Name: (2017 YR1)")
        expect(page).to have_content("NEO Reference ID: 3794979")
      end
    end
  end
end
