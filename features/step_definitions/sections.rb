# Sections
# --------

When(/^the user goes to the (.*?) section$/) do |section_name|
    section_name = section_name.downcase
    page_header_text = on(Sidebar).goto_section(section_name)
    expect(page_header_text).to eq(section_name)
end
